class TasksController < ApplicationController
  NAMESPACE = '/tasks/'

  get '/add' do
    @title = 'Publish a task'
    erb :'add_task.html'
  end

  post '/add-task' do
    title = params[:task_title]
    description = params[:task_description]
    reward = params[:task_reward]
    location = params[:task_location]

    task = Task.new  user: logged_user,
                     title: title,
                     description: description,
                     reward: reward,
                     location: location
    task.save

    redirect NAMESPACE
  end
end

