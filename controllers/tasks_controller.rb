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

    redirect "/tasks/#{task.id}"
  end

  post '/complete/:id' do
    task = Task.find(id: params[:id])

    if task.nil?
      redirect "/not_found"
    end

    if params[:accept]
      task.update state: 3
      task.approved_application.update status: 3
    else
      task.update state: 2
    end

    redirect "tasks/#{task.id}"
  end

  get '/:id' do
    task = Task.find(id: params[:id])

    if task.nil?
      redirect "/not_found"
    end

    @title = task.title

	@current_user = logged_user
    erb :task_summary, locals: {task: task}
  end

  post '/review_application/:id' do
    application = Application.find(id: params[:id])

    if application.nil?
      redirect "/not_found"
    end

    if params[:accept]
      application.update status: 1
      other_applications = Application.where(task: application.task).all
                                      .select { |other_application| other_application.id != application.id }

      other_applications.each do |other_application|
          print other_application.inspect
          other_application.update status: 2
      end

      application.task.update state: 1
    else
      application.update status: 2
    end

    redirect "/tasks/#{application.task.id}"
  end

  post '/add_application' do
      task_id = params[:task_id]
      share = params[:share].to_f / 100
      charity = Charity.find(title: params[:charity])
      motivation = params[:motivation]

      task = Task.find(id: task_id)
      if task.nil?
        redirect "/not_found"
      end

      application = Application.new user: logged_user, charity: charity, task: task, share: share, motivation: motivation
      application.save

      redirect "/tasks/#{task_id}"
  end
end

