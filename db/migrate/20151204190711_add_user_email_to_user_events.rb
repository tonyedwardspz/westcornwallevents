class AddUserEmailToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :user_name, :string
    add_column :user_events, :user_email, :string
  end
end
