class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  validates :title, presence: true
  validates :slug, presence: true
  validates :content, presence: true
end
