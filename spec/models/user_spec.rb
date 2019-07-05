# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  before do
    @user = FactoryGirl.create(:user)
  end

  ########## Mixed Validation ##########

  it 'is valid with email and password' do
    expect(@user).to be_valid
  end

  ########## Email Validation ##########

  it 'is invalid without email' do
    @user.email = nil
    @user.valid?
    expect(@user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid if email is too long' do
    @user.email = 'a' * 244 + '@example.com'
    expect(@user).to_not be_valid
  end

  it 'should accept valid email address' do
    valid_addresses = %w[user@example.com USER@foo.com U_S-ER@foo.bar.org
                         first.last@foo.jp first+last@foo.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end

  it 'should reject invalid email address' do
    invalid_addresses = %w[user@example,com user_at_sign.com user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).to_not be_valid
    end
  end

  it 'is invalid with duplicate email address' do
    user = FactoryGirl.build(:user, email: @user.email)
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it 'must save email address in lower case' do
    mixed_case_email = 'Admin@EXAmple.com'
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq(@user.reload.email)
  end

  ########## Password Validation ##########

  it 'is invalid without password' do
    @user.password = nil
    @user.valid?
    expect(@user.errors[:password]).to include("can't be blank")
  end

  it 'is valid if contain atleast 5 characters long password' do
    @user.password = '5 characters long'
    expect(@user).to be_valid
  end

  it 'is invalid if less than 5 characters' do
    @user.password = 'four'
    expect(@user).to_not be_valid
  end

  ########## Other Validation ##########

  it 'has many websites' do
    user1 = FactoryGirl.create(:user, email: 'admin1@example.com')
    w1 = FactoryGirl.create(:website, user_id: @user.id)
    w2 = FactoryGirl.create(:website, user_id: @user.id)
    w3 = FactoryGirl.create(:website, user_id: user1.id)

    expect(@user.websites).to include(w1, w2)
    expect(@user.websites).to_not include(w3)
  end
end
