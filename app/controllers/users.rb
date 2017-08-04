get '/users/new' do
  erb :'/users/new_user'
end

post '/users' do
  @user = User.new(params[:user])
  if params[:user][:password] == 'RAIN SHINE'
    redirect '/rainy_day'
  end
  if @user.save
    login(@user)
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new_user'
  end

end