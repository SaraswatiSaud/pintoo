require 'rails_helper'

RSpec.describe Website, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:website)).to be_valid
  end

  before do
    @user = FactoryGirl.create(:user)
    @website = FactoryGirl.create(:website, user_id: @user.id)
  end

  it 'it valid with name, subdomain and user_id' do
    expect(@website).to be_valid
  end

  it 'is invalid without name' do
    @website.name = nil
    expect(@website).to_not be_valid
  end

  it 'is invalid with duplicate name' do
    website = FactoryGirl.build(:website, name: @website.name)
    website.valid?
    expect(website.errors[:name]).to include('has already been taken')
  end

  it 'is valid if has 3 characters long name' do
    @website.name = '5 characters long'
    expect(@website).to be_valid
  end

  it 'is invalid if it not 3 characters long name' do
    @website.name = 'ww'
    expect(@website).to_not be_valid
  end

  it 'is invalid without subdomain' do
    @website.subdomain = nil
    expect(@website).to_not be_valid
  end

  it 'is invalid with duplicate subdomain' do
    website = FactoryGirl.build(:website, subdomain: @website.subdomain)
    website.valid?
    expect(website.errors[:subdomain]).to include('has already been taken')
  end

  it 'is valid if has 3 characters long subdomain' do
    @website.subdomain = '3 characters long'
    expect(@website).to be_valid
  end

  it 'is invalid if it not 3 characters long subdomain' do
    @website.subdomain = 'ww'
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
