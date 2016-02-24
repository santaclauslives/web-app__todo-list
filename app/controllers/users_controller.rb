MyApp.get "/user_new" do  


  erb :"user_new"
end


MyApp.post "/user_create/" do
  @user = User.new
  @user.email = (params[:email])
  @user.password = (params[:password])
  @user.save

  erb :"success_user_create"
end


