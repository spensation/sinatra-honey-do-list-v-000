require 'spec_helper'
require 'pry'

describe ApplicationController do

  describe "Homepage" do
    it 'loads the homepage' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include("Honey, can you please...?")
    end
  end

  describe "Signup Page" do

    it 'loads the signup page' do
      get '/signup'
      expect(last_response.status).to eq(200)
    end

    it 'signup directs user to honey do index' do
      params = {
        :username => "honeybear",
        :email => "honeybear@yahoo.com",
        :password => "willdo321"
      }
      post '/signup', params
      expect(last_response.location).to include("/tasks")
    end

    it 'does not let a user sign up without a username' do
      params = {
        :username => "",
        :email => "honeybear@yahoo.com",
        :password => "willdo321"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without an email' do
      params = {
        :username => "honeybear",
        :email => "",
        :password => "willdo321"
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a user sign up without a password' do
      params = {
        :username => "honeybear",
        :email => "honeybear@yahoo.com",
        :password => ""
      }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

    it 'does not let a logged in user view the signup page' do
      user = User.create(:username => "honeybear", :email => "honeybear@yahoo.com", :password => "willdo321")
      params = {
        :username => "honeybear",
        :email => "honeybear@yahoo.com",
        :password => "willdo321"
      }
      post '/signup', params
      session = {}
      session[:user_id] = user.id
      get '/signup'
      expect(last_response.location).to include('/tasks')
    end
  end

end
