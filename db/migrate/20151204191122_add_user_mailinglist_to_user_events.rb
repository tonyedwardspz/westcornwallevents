class AddUserMailinglistToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :add_to_mailling_list, :boolean
  end
end
