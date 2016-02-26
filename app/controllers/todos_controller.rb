

# This is for a post - redirect - get. 

#Shows the edit form
MyApp.get "/todos/todos_edit/:id" do
  @todos = Todo.find_by_id(params[:id])

  erb :"/todos/todos_edit"
end

#Processes the edit form
MyApp.post "/todos/todos_update/:id" do
  @todos = Todo.find_by_id(params[:id])
  @todos.title = (params[:title])
  @todos.description = (params[:description]) 


  @todos.completed = !(params[:completed].nil?)

  # if params[:completed].first == "on"
  #   @todos.completed = true
  # else
  #   @todos.completed = false
  # end
  @todos.save

  erb :"todos/todos_update"
end

#Home page for the To Do list program. Will display the To Do list.
#Each todo will be An Array object. The .erb page will have to use an each do loop to iterate through each object and display the title-description-completed. Not sure how to use the id column quite yet. Do I need to capture a session id to make a new to do on this list?  

MyApp.get "/todos/todo_home" do

  @todos = Todo.all

  erb :"/todos/todo_home"
end


#This controller action will make the new todo form available to the user. 
MyApp.get "/todos/todos_new" do

  @current_user = User.find_by_id(session[:user_id])
  if @current_user != nil
    erb :"todos/todos_new"
  else
    redirect "/logins/login_new"
  end
end

#This controller action will process the new todo form to create a record of a new todo.
MyApp.post "/todos/todos_create" do
  @todo = Todo.new
  @todo.title = (params[:title])
  @todo.description = (params[:description])
  @todo.completed = (params[:completed])
  @todo.created_by = (session[:user_id])
  @todo.save

  erb :"/todos/todos_create" #build a success page with link to home and link to add another todo and link to logout
end

# MyApp.get "/todos/todos_delete/:id"
#I am asserting that "delete" is the ultimate edit, also asserting the users would prefer to delete from the edit page rather than have to go to another page to do that. So I have added a delete button to the edit page. 

MyApp.post "/todos/todos_delete/:id" do
  @todo = Todo.find_by_id(session[:user_id])
  @todo.delete

  @todos = Todo.all
  redirect "/todos/todo_home" 
end
