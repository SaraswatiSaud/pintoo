# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Websites', type: :feature do
  before(:each) do
    @user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Log In'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  scenario 'user creates a new website' do
    expect do
      click_link 'Websites'
      click_link 'Add Website'
      fill_in 'Name', with: 'Website 1'
      fill_in 'Subdomain', with: 'website1'
      click_button 'Save Website'
    end.to change(@user.websites, :count).by(1)

    expect(page).to have_content 'Website 1'
    expect(page).to have_content 'website1'
  end

  scenario 'user creates a show page' do
    website = FactoryGirl.create(:website, user: @user)
    visit websites_path
    click_link website.name.to_s

    expect(page).to have_content website.name.to_s
  end

  scenario 'user edits an article' do
    website = FactoryGirl.create(:website, user: @user)
    visit edit_website_path(website)
    expect do
      fill_in 'Name', with: 'Edit name'
      fill_in 'Subdomain', with: 'Edit subdomain'
      click_button 'Update Website'
    end.to_not change(@user.websites, :count)
  end

  scenario 'user logout the page' do
    visit websites_path
    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end
end
