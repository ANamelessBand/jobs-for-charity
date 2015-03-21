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
    @title = 'Dashboard'

    @tasks = Task.take LAST_TASKS_COUNT
    erb :'dashboard.html'
  end
end

