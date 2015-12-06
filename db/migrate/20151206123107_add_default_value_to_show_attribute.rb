class AddDefaultValueToShowAttribute < ActiveRecord::Migration
  def change
    change_column :user_events, :add_to_mailling_list, :boolean, default: true
  end
end
