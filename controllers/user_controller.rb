#require 'digest/sha1'

class UserController < ApplicationController
  NAMESPACE = '/user/'
  
  post '/register' do
    username = params[:username]
    password = params[:password]
    email = params[:email]

    user = User.new username: username, password: password, email: email
    user.save

    login_user user

    redirect '/dashboard'
  end

  post '/login' do
    username = params[:username]
    password = params[:password]

    user = User.find(username: username) #add password check too
    if user
      login_user user
      redirect '/dashboard'
    else
      # add error and print correct erb instead of redirect
      redirect '/user/'
    end
  end

  get '/logout' do
    logout_user
  end
end

