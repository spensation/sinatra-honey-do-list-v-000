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
    @task.save

    erb :'/tasks/show'
  end

  get '/tasks/:id' do
    @task = Task.find_by_id(params[:id])
    erb :'/tasks/show'
  end

  get '/tasks/:id/edit' do
    @task = Task.find(params[:id])

    erb :'/tasks/edit'
  end

  patch '/tasks/:id' do
    @task = Task.find_by_id(params[:id])
    @task.update(title: params[:title])
    redirect "/tasks/#{params[:id]}"
  end

  delete '/tasks/:id/delete' do
    @task = Task.find_by_id(params[:id])
    @task.destroy
    erb :'/tasks/deleted'
  end
end
