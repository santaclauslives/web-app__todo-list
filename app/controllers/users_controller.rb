MyApp.get "/user/user_new" do  


  erb :"user/user_new"
end


MyApp.post "/user/user_create" do
  @user = User.new
  @user.name = (params[:name])
  @user.email = (params[:email])
  @user.password = (params[:password])
  @user.save

  erb :"user/user_create"
end





