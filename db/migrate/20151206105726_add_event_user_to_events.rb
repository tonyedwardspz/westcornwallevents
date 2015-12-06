class AddEventUserToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :event_user, index: true, foreign_key: true
  end
end
