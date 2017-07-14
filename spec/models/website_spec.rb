require 'rails_helper'

RSpec.describe Website, type: :model do
  before(:each) do
    @user = User.create(email: 'admin@example.com', password: 'password')
    @website = Website.create(name: 'Website 1', subdomain: 'website1', user_id: @user.id)
  end

  it 'it valid with name, subdomain and user_id' do
    expect(@website).to be_valid
  end

  it 'is invalid without name' do
    @website.name = nil
    expect(@website).to_not be_valid
  end

  it 'is invalid with duplicate name' do
    website = Website.new(name: 'Website 1', subdomain: 'website2')
    website.valid?
    expect(website.errors[:name]).to include('has already been taken')
  end

  it 'is valid if has 5 characters long name' do
    @website.name = '5 characters long'
    expect(@website).to be_valid
  end

  it 'is invalid if it not 5 characters long name' do
    @website.name = 'four'
    expect(@website).to_not be_valid
  end

  it 'is invalid without subdomain' do
    @website.subdomain = nil
    expect(@website).to_not be_valid
  end

  it 'is invalid with duplicate subdomain' do
    website = Website.new(name: 'Website 2', subdomain: 'website1')
    website.valid?
    expect(website.errors[:subdomain]).to include('has already been taken')
  end

  it 'is valid if has 5 characters long subdomain' do
    @website.subdomain = '5 characters long'
    expect(@website).to be_valid
  end

  it 'is invalid if it not 5 characters long subdomain' do
    @website.subdomain = 'four'
    expect(@website).to_not be_valid
  end

  it 'is invalid without user_id' do
    @website.user_id = nil
    expect(@website).to_not be_valid
  end

  it 'belongs to user' do
    expect(@website.user).to eq @user
  end
end
