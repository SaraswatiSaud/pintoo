require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @website = FactoryGirl.create(:website, user_id: @user.id)
    @menu = FactoryGirl.create(:menu, website_id: @website.id)
    sign_in @user
  end

  describe '#show' do
    context 'as an authorized user' do
      it 'responds successfully' do
        get :show, params: { website_id: @website.id, id: @menu.id }
        expect(response).to be_success
      end
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'creates a new menu' do
        menu_params = FactoryGirl.attributes_for(:menu, name: 'New menu name')
        expect {
          post :create, params: { website_id: @website.id, id: @menu.id, menu: menu_params }
        }.to change(@website.menus, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnot adds a menu' do
        menu_params = FactoryGirl.attributes_for(:menu, :invalid )
        expect {
          post :create, params: { website_id: @website.id, id: @menu.id, menu: menu_params }
        }.to_not change(@website.menus, :count)
      end
    end
  end

  describe '#update' do
    context 'as an authorized user' do
      it 'updates a menu' do
        menu_params = FactoryGirl.attributes_for(:menu, name: 'New menu name')
        patch :update, params: { website_id: @website.id, id: @menu.id, menu: menu_params }
        expect(@menu.reload.name).to eq 'New menu name'
      end
    end
  end

  describe '#destroy' do
    context 'as an authorized user' do
      it 'destroys a menu' do
        expect {
          delete :destroy, params: { website_id: @website.id, id: @menu.id }
        }.to change(@website.menus, :count).by(-1)
      end
    end
  end
end
