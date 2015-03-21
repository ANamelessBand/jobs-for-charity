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

  get '/add' do
    @title = 'Publish a task'
    erb :'add_task.html'
  end

  post '/add-task' do
    title = params[:task_title]
    description = params[:task_description]
    reward = params[:task_reward]
    location = params[:task_location]
    add_task logged_user, title, description, reward, location
    redirect NAMESPACE
  end
end

