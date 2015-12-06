class AddAddToMailingListToEventUser < ActiveRecord::Migration
  def change
    add_column :event_users, :add_to_mailling_list, :boolean
  end
end
