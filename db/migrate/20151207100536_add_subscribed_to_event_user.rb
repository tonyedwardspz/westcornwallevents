class AddSubscribedToEventUser < ActiveRecord::Migration
  def change
    add_column :event_users, :subscribed, :boolean
    remove_column :event_users, :number_submitted, :string
  end
end
