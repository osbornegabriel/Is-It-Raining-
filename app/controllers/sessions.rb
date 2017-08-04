get '/sessions/new' do
  erb :'/sessions/new_session'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  p 'BANANAS'
  p @user
  if User.validate_password(@user, params[:password])
    login(@user)
    redirect '/'
  else
    @errors = "Incorrect password or username"
    erb :'/sessions/new_session'
  end
end

get '/sessions/logout' do
  logout
  erb :'index'
end