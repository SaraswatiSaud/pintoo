class Page < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :website_id, presence: true
  belongs_to :website

  extend FriendlyId
  friendly_id :name, use: :slugged
end