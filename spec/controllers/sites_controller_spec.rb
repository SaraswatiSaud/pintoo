# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  describe '#index' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end

    it 'response a 200 request' do
      get :index
      expect(response).to have_http_status '200'
    end
  end
end
