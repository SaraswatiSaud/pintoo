# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WebsitesController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @website = FactoryGirl.create(:website, user: @user)
    sign_in @user
  end

  describe '#index' do
    context 'as an authorized user' do
      it 'responds successfully' do
        get :index
        expect(response).to be_success
      end

      it 'returns a 200 response' do
        get :index
        expect(response).to have_http_status '200'
      end
    end
  end

  describe '#show' do
    it 'responds successfully' do
      get :show, params: { id: @website.id }
      expect(response).to be_success
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'adds a new website' do
        website_params = FactoryGirl.attributes_for(:website)
        sign_in @user
        expect do
          post :create, params: { website: website_params }
        end.to change(@user.websites, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnot adds a website' do
        website_params = FactoryGirl.attributes_for(:website, :invalid)
        sign_in @user
        expect do
          post :create, params: { website: website_params }
        end.to_not change(@user.websites, :count)
      end
    end
  end

  describe '#update' do
    it 'updates a website' do
      website_params = FactoryGirl.attributes_for(:website, name: 'New website name')
      sign_in @user
      patch :update, params: { id: @website.id, website: website_params }
      expect(@website.reload.name).to eq 'New website name'
    end
  end

  describe '#destroy' do
    it 'destroys a website' do
      sign_in @user
      expect do
        delete :destroy, params: { id: @website.id }
      end.to change(@user.websites, :count).by(-1)
    end
  end
end
