MyApp.get "/users/user_new" do  


  erb :"/users/user_new"
end


MyApp.post "/users/user_create" do
  @user = User.new
  @user.name = (params[:name])
  @user.email = (params[:email])
  @user.password = (params[:password])
  @user.save

  erb :"/users/user_create"
end





