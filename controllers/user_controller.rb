#require 'digest/sha1'

class UserController < ApplicationController
  NAMESPACE = '/user/'

  post '/register' do
    username = params[:username]
    password = params[:password]
    email = params[:email]
    charity_types = params.keys.select { |key| key.start_with? 'charity_type' }
                           .map { |key| key.sub("charity_type_", "").to_i }

    user = User.new username: username, password: password, email: email
    user.save

    print charity_types
    charity_types.each do |charity_type|
        user.add_charity_type CharityType.find(id: charity_type)
    end

    login_user user

    redirect '/index'
  end

  get '/login' do
    @title = 'Log in!'
    @charities = CharityType.all

    erb :signupin
  end

  post '/login' do
    username = params[:username]
    password = params[:password]

    user = User.find(username: username) #add password check too
    if user
      login_user user
      redirect '/index'
    else
      # add error and print correct erb instead of redirect
      redirect '/user/'
    end
  end

  get '/logout' do
    logout_user
  end

   get '/:id' do
    @title = "User information"
    @user = User.find(id: params[:id]);


    erb :profile
  end
end

