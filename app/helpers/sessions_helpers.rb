helpers do

  def logged_in?
    !!session[:user_id]
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
  end

  def current_user
    @user ||= User.find_by(id: current_user_id)
  end

  def current_user_id
    session[:user_id]
  end

end