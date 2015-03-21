module UserHelpers
  def logged?
    !session[:user].nil?
  end
  
  def logged_user
    User.find(id: session[:user]) if logged?
  end

  def login_user(user)
      session[:user] = user.id
  end

  def logout_user
      session[:user] = nil
      redirect '/'
  end
end