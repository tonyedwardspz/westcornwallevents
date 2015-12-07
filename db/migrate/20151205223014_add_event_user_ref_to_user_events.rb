class AddEventUserRefToUserEvents < ActiveRecord::Migration
  def change
    add_reference :user_events, :event_user, index: true, foreign_key: true
  end
end
