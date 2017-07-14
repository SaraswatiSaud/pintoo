class Website < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 5 } 
  validates :subdomain, presence: true
end
