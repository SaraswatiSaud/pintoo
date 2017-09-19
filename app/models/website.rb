class Website < ApplicationRecord
  validates :name, :subdomain, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :menus
end
