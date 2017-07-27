class UsersController < ApplicationController

  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      erb :'/users/show'
    else
      redirect '/signup'
    end
  end

  get '/users/home' do
    if logged_in?
       @user = current_user
       erb :'/users/show'
     else
       redirect '/login'
     end
  end

end
