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

    redirect '/dashboard'
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
      redirect '/dashboard'
    else
      # add error and print correct erb instead of redirect
      redirect '/user/login'
    end
  end

  get '/logout' do
    logout_user
  end


  get '/top' do
    @title = "Top Users"
    @top_employers = User.top_employers.take TOP_USERS_TO_SHOW
    @top_employees = User.top_employees.take TOP_USERS_TO_SHOW

    erb :'topusers.html'
  end

   get '/:id' do
    @title = "User information"
    @user = User.find(id: params[:id]);


    erb :profile
  end

end

