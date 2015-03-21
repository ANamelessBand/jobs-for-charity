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

    #@tasks = Tasks.newest.take LAST_TASKS_COUNT
    @tasks = [{title: 'asdf', charity: 'Red cross', reward: 200},
              {title: 'asdf', charity: 'Red cross', reward: 200},
              {title: 'asdf', charity: 'Red cross', reward: 200}
            ]
    erb :'dashboard.html'
  end
end

