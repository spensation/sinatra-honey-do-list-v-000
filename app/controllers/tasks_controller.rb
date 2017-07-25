class TasksController < ApplicationController

  get '/tasks' do
    if !logged_in?
      redirect "/login"
    else
      @user = User.find(session[:user_id])
      @tasks = Task.all
      erb :'/tasks/index'
    end
  end

  get '/tasks/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :'/tasks/new'
    end
  end

  post '/tasks' do
    @task = Task.create(title:params[:title])
    if @task.save
      erb :"/tasks/#{@task.id}"
    else
      redirect "/tasks/new"
    end
  end

end
