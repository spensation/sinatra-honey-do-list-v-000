require 'pry'
class SessionsController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  post '/login' do

    @user = User.find_by(username: params[:user][:username])
    #binding.pry
    if !logged_in? && @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect "/users/home"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end
end
