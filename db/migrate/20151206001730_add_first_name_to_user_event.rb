class AddFirstNameToUserEvent < ActiveRecord::Migration
  def change
    add_column :user_events, :first_name, :string
    add_column :user_events, :last_name, :string
    remove_column :user_events, :user_name, :string
  end
end
