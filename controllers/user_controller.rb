#require 'digest/sha1'

class UserController < ApplicationController
  NAMESPACE = '/user/'
  
  get '/:id' do
    @title = "User information"
    @user = User.find(id: params[:id]);
    
    @rewardsDonated = 0
    ratingsSum = 0;
    
    completedApplications = Application.where(user: @user, status: 3).all
    completedApplications.each do |application|
      @rewardsDonated += (application.task.reward)*(application.share)
      ratingsSum += application.rating
    end
    
    @completedTasksCount = completedApplications.size
    if @completedTasksCount == 0
      @avgRating = "Not available"
    else
      @avgRating = ratingsSum/@completedTasksCount
    end
    
    @recentlyCompleted = []
    completedApplications.last(PROFILE_RECENTLY_COMPLETED_COUNT).each do |recentTask|
      recentlyCompleted.push(recentTask.title)
    end
  
    erb :profile
  end

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
      redirect '/user/'
    end
  end

  get '/logout' do
    logout_user
  end
end

