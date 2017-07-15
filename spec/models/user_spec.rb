require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(email: 'admin@example.com', password: 'password')
  end

  it 'is valid with email and password' do
    expect(@user).to be_valid
  end

  it 'is invalid without email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is invalid without password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'is valid if contain atleast 5 characters long password' do
    @user.password = '5 characters long'
    expect(@user).to be_valid
  end

  it 'is invalid if doesnot contain atleast 5 characters long password' do
    @user.password = 'four'
    expect(@user).to_not be_valid
  end

  it 'is invalid with duplicate email address' do
    user = User.new(email: 'admin@example.com', password: 'password1')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'has many websites' do
    user1 = User.create(email: 'admin1@example.com', password: 'password')
    w1 = Website.create(name: 'Website 1', subdomain: 'website1', user_id: @user.id)
    w2 = Website.create(name: 'Website 2', subdomain: 'website2', user_id: @user.id)
    w3 = Website.create(name: 'Website 3', subdomain: 'website3', user_id: user1.id)

    expect(@user.websites).to include(w1, w2)
    expect(@user.websites).to_not include(w3)
  end
end
