class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :festival
  belongs_to :venue
end
