class EventUser < ActiveRecord::Base
  has_many :events, dependent: :nullify


end
