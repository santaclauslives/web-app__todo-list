MyApp.get "/user/new" do  


  erb :"user_new"
end


MyApp.post "/user/create" do
  @user = User.new
  @user.name = (params[:name])
  @user.email = (params[:email])
  @user.password = (params[:password])
  @user.save

  erb :"user_create"
end





