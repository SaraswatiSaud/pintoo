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
    expect(@user.websites).to eq([])
  end
end
