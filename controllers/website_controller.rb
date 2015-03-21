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

    @tasks = Task.take LAST_TASKS_COUNT
    erb :'dashboard.html'
  end
end

