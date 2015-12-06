class RemoveUserNameFromUserEvents < ActiveRecord::Migration
  def change
    remove_column :user_events, :user_email, :string
    remove_column :user_events, :user_name, :string
  end
end
