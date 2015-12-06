class EventUser < ActiveRecord::Base
  has_many :user_events
  accepts_nested_attributes_for :user_events
end
