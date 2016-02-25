MyApp.get "/users/user_new" do  


  erb :"users/user_new"
end


MyApp.post "/users/user_create" do
  @user = User.new
  @user.name = (params[:name])
  @user.email = (params[:email])
  @user.password = (params[:password])
  @user.save

  erb :"/users/user_create"
end

MyApp.get "/users/user_create" do
  erb :"/logins/login_new"
end

# MyApp.post "/logins/login_create" do

#   @user = User.find_by_email(params[:email])

#   if @user && @user.password == params[:password]
#     session[:user_id] = @user.id
#     # Process the form to log a person in.
#    
#     erb :"logins/login_success"
#   else
#     erb :"logins/login_failed"
#   end
# end


MyApp.post "/users/user_delete" do
  @user = User.find_by_id(session[:user_id])
  @user.delete

#   @user = User.find_by_name(params[:name])

#   if @user && @user.password == params[:password]
#   session[:user_id] = @user.id 
#   @user.delete#no need to be selective, deleting the whole user
# end

erb :"/user_delete_success"
end

MyApp.post "/users/user_update" do
  @user = User.find_by_id(session[:user_id])
  @user.name = (params[:name]) #put these in the form. leave them here also
  @user.email = (params[:email])
  @user.password = (params[:password])
  @user.save

  erb :"/users/user_update_success"
end
