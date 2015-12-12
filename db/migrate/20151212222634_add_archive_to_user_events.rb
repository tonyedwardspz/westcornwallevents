class AddArchiveToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :archived, :boolean, null: false, default: false
  end
end
