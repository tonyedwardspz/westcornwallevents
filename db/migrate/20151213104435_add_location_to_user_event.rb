class AddLocationToUserEvent < ActiveRecord::Migration
  def change
    add_reference :user_events, :venue, index: true
  end
end
