require 'rails_helper'

RSpec.describe Page, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:page)).to be_valid
  end

  before(:each) do
    @user = FactoryGirl.create(:user)
    @website = FactoryGirl.create(:website, user_id: @user.id )
    @page = FactoryGirl.create(:page, website_id: @website.id )
  end

  it 'is valid with name and website_id' do
    expect(@page).to be_valid
  end

  it 'is invalid without name' do
    @page.name = nil
    expect(@page).to_not be_valid
  end

  it 'is invalid without website_id' do
    @page.website_id = nil
    expect(@page).to_not be_valid
  end

  it 'is valid if name is 3 or more characters long' do
    @page.name = '# characters long'
    expect(@page).to be_valid
  end

  it 'is invalid if name is less than 3 characters' do
    @page.name = 'ww'
    expect(@page).to_not be_valid
  end

  it 'page name is same for different websites' do
    page2 = FactoryGirl.build(:page, name: @page.name)
    website2 = FactoryGirl.create(:website)
    page2.website_id = website2.id
    expect(page2).to be_valid
  end

  it 'is invalid with duplicate page name for same website' do
    page2 = Page.create(name: @page.name, slug: @page.slug, website_id: @website.id )
    page2.valid?
    expect(page2.errors[:name]).to include('has already been taken')
  end

  it 'belongs to website' do
    expect(@page.website).to eq @website
  end
end
