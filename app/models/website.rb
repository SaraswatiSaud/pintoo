class Website < ApplicationRecord
  validates :name, :subdomain, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :user_id, presence: true
  belongs_to :user
  has_many :menus
  has_many :pages

  extend FriendlyId
  friendly_id :name, use: :slugged
end
