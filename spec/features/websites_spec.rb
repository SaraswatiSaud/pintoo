require 'rails_helper'

RSpec.feature "Websites", type: :feature do
  scenario 'user creates a new website' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Log In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect {
      click_link 'Websites'
      click_link 'Add Website'
      fill_in 'Name', with: 'Website 1'
      fill_in 'Subdomain', with: 'website1'
      click_button 'Save Website'
    }.to change(user.websites, :count).by(1)

    expect(page).to have_content 'Website 1'
    expect(page).to have_content 'website1'
  end
end
