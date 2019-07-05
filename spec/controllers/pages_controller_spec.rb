# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @website = FactoryGirl.create(:website, user_id: @user.id)
    @page = FactoryGirl.create(:page, website_id: @website.id)
  end

  describe '#show' do
    context 'as an authorized user' do
      it 'responds successfully' do
        get :show, params: { website_id: @website.id, id: @page.id }
        expect(response).to be_success
      end
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'creates a new page' do
        page_params = FactoryGirl.attributes_for(:page, name: 'New page name')
        expect do
          post :create, params: { website_id: @website.id, id: @page.id, page: page_params }
        end.to change(@website.pages, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnot creates a new page' do
        page_params = FactoryGirl.attributes_for(:page, :invalid)
        expect do
          post :create, params: { website_id: @website.id, id: @page.id, page: page_params }
        end.to_not change(@website.pages, :count)
      end
    end
  end

  describe '#update' do
    context 'as an authorized user' do
      it 'updates a page' do
        page_params = FactoryGirl.attributes_for(:page, name: 'New page name')
        patch :update, params: { website_id: @website.id, id: @page.id, page: page_params }
        expect(@page.reload.name).to eq 'New page name'
      end
    end
  end

  describe '#destroy' do
    it 'destroys a page' do
      expect do
        delete :destroy, params: { website_id: @website.id, id: @page.id }
      end.to change(@website.pages, :count).by(-1)
    end
  end
end
