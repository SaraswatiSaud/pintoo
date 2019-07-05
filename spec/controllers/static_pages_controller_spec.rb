# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe '#index' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end

    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe '#contact' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it 'responds successfully' do
      get :contact
      expect(response).to be_success
    end

    it 'returns a 200 response' do
      get :contact
      expect(response).to have_http_status '200'
    end
  end

  describe '#dashboard' do
    context 'as an authorized user' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it 'responds successfully' do
        get :dashboard
        expect(response).to be_success
      end

      it 'returns a 200 response' do
        get :dashboard
        expect(response).to have_http_status '200'
      end
    end

    context 'as a guest user' do
      it 'returns a 302 response' do
        get :dashboard
        expect(response).to have_http_status '302'
      end

      it 'redirects to sign in page' do
        get :dashboard
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
