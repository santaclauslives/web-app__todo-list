
#Home page for the To Do list program. Will display the To Do list.
#Each todo will be An Array object. The .erb page will have to use an each do loop to iterate through each object and display the title-description-completed. Not sure how to use the id column quite yet. Do I need to capture a session id to make a new to do on this list?  

MyApp.get "/todos/todo_home" do

  @todos = Todo.all

  erb :"/todos/todo_home"
end


#This controller action will make the new todo form available to the user. 
MyApp.get "/todos/todos_new" do


  erb :"todos/todos_new"
end
#This controller action will process the new todo form to create a record of a new todo.
MyApp.post "/todos/todos_create" do
  @todo = Todo.new
  @todo.title = (params[:title])
  @todo.description = (params[:description])
  @todo.completed = (params[:completed])
  @todo.id #is this column for the session id?
  @todo.save

  erb :"/todos/todo_create" #build a success page with link to home and link to add another todo and link to logout
end

#need an edit page to display the edit form, and an update page to process the edit form.

MyApp.post "/todos/todo_delete" do
  @todo = Todo.find_by_id(session[:user_id])
  @todo.delete


  erb :"todo_deleted"#make a success page 
end
