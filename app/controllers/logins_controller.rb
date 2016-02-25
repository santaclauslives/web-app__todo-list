# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.
MyApp.get "logins/login_delete" do
  session[:user_id] = nil
end

MyApp.get "/logins/login_new" do
    # Show form that lets a person attempt a login.
    erb :"/logins/login_new"
end

MyApp.post "/logins/login_create" do

  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    # Process the form to log a person in.
    erb :"logins/login_success"
  else
    erb :"logins/login_failed"
  end
end

MyApp.get "/logins/login_success" do
  erb :"/todos/todo_home"
end

MyApp.get "/logins/login_failed" do
  erb :"/logins/login_new"
end
