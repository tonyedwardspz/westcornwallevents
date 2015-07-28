class Venue < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name,  use: [:slugged, :finders]
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :url, presence: true
  has_many :events
end
