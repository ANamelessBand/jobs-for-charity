class WebsiteController < ApplicationController
  NAMESPACE = '/'
  
  not_found do
    @title = "404: Droid not found"
    erb :'not_found.html'
  end

  get '/magic/' do
    erb :signupin
  end

  get '/' do
    redirect '/dashboard' if logged?
    @title = "Welcome to Tasks for Charity"
    @charities = CharityType.all
    erb :signupin
  end

  get '/dashboard' do
    @title = 'Dashboard'

    @tasks = Task.where(state: 0).take LAST_TASKS_COUNT
    @completed_tasks = Task.where(state: 3).take LAST_TASKS_COUNT
    erb :'dashboard.html'
  end
end

