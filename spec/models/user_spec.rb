require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  before do
    @user = FactoryGirl.create(:user)
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
    user = FactoryGirl.build(:user, email: @user.email)
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'has many websites' do
    user1 = FactoryGirl.create(:user, email: 'admin1@example.com')
    w1 = FactoryGirl.create(:website, user_id: @user.id)
    w2 = FactoryGirl.create(:website, user_id: @user.id)
    w3 = FactoryGirl.create(:website, user_id: user1.id)

    expect(@user.websites).to include(w1, w2)
    expect(@user.websites).to_not include(w3)
  end
end
