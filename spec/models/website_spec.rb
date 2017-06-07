require 'rails_helper'

RSpec.describe Website, type: :model do
  describe 'presence website name and subdomain' do
    it 'is invalid without website name' do
      website = Website.new(name: nil)
      expect(website).not_to be_valid
    end

    it 'is invalid without website subdomain' do
      website = Website.new(name: 'Website 1', subdomain: nil)
      expect(website).not_to be_valid
    end
  end
end
