require 'pry'
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
    @task = Task.new(:title => params[:title])
    @task.user = User.find_or_create_by(user_id: params[:user_id])
    @task.save
    #binding.pry
    erb :'/tasks/show'
  end

  get '/tasks/:id' do
    @task = Task.find_by_id(params[:id])
    erb :'/tasks/show'
  end

end
