class EventUser < ActiveRecord::Base
  has_many :events, dependent: :nullify

  def self.event_user_from_user_event(user_event, event)
    event_user = EventUser.new
    event_user.first_name = user_event.first_name
    event_user.last_name = user_event.last_name
    event_user.email = user_event.user_email
    event_user.subscribed = user_event.add_to_mailling_list
    event_user.events << event
    return event_user
  end
end
