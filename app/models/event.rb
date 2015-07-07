class Event < ActiveRecord::Base
  belongs_to :festival
  belongs_to :venue
end
