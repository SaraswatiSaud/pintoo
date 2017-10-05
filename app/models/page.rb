class Page < ApplicationRecord
  belongs_to :website

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
