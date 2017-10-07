class Menu < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: { scope: :website_id }
  validates :website_id, presence: true
  belongs_to :website

  extend FriendlyId
  friendly_id :name, use: :slugged
end
