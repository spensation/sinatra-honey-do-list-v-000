require 'spec_helper'

describe 'User' do
  before do
    @user = User.create(:username => "honeybear", :email => "honeybear@yahoo.com", :password => "willdo321")
  end

  it 'has a secure password' do

    expect(@user.authenticate("cat")).to eq(false)
    expect(@user.authenticate("willdo321")).to eq(@user)
  end
end
