class Website < ApplicationRecord
  belongs_to :user
  validates :name, :subdomain, presence: true
end
