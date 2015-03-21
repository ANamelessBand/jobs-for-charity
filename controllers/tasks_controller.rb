class TasksController < ApplicationController
  NAMESPACE = '/tasks/'

  get '/' do
    @title = 'All Tasks'

    state = 0
    state = 3 if params[:completed]

    show_tasks_table Task.where(state: state).all
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

    task = Task.new  user: logged_user,
                     title: title,
                     description: description,
                     reward: reward,
                     location: location
    task.save

    redirect NAMESPACE
  end

  get '/:id' do
    task = Task.find(id: params[:id])

    if task.nil?
      status 404
      erb :not_found
    end

    @title = task.title

    erb :magic_task_summary, locals: {task: task}
  end
end

