require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:menu)).to be_valid
  end

  before do
    @user = FactoryGirl.create(:user)
    @website = FactoryGirl.create(:website, user_id: @user.id)
    @menu = FactoryGirl.create(:menu, website_id: @website.id)
  end

  it 'is valid with name, slug and website_id' do
    expect(@menu).to be_valid
  end

  it 'is invalid without name' do
    @menu.name = nil
    expect(@menu).to_not be_valid
  end

  it 'is valid if name is 3 or more characters long' do
    @menu.name = '3 characters long'
    expect(@menu).to be_valid
  end

  it 'is invalid if name is less than 3 characters' do
    @menu.name = 'ww'
    expect(@menu).to_not be_valid
  end

  it 'menu name is same for different websites' do
    @menu2 = FactoryGirl.build(:menu, name: @menu.name)
    website2 = FactoryGirl.create(:website)
    @menu2.website_id = website2.id
    expect(@menu2).to be_valid
  end

  it 'is invalid with duplicate menu name for same website' do
    menu2 = Menu.new(name: @menu.name, slug: @menu.slug, website_id: @website.id)
    menu2.valid?
    expect(menu2.errors[:name]).to include('has already been taken')
  end

  it 'is invalid without website_id' do
    @menu.website_id = nil
    expect(@menu).to_not be_valid
  end

  it 'belongs to a website' do
    expect(@menu.website).to eq @website
  end
end
