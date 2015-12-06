class RemoveAddToMailingListFromUserEvents < ActiveRecord::Migration
  def change
    remove_column :user_events, :add_to_mailling_list, :boolean
  end
end
