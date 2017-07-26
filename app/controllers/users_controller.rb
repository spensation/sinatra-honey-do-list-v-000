class UsersController < ApplicationController

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      erb :'/users/show'
    else
      redirect '/signup'
    end
  end

  get '/users/show' do
    erb :'/users/show'
  end

end
