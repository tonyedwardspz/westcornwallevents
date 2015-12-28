class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :display_name, :string
    add_column :users, :twitter, :string
    add_reference :blogs, :user, index: true, foreign_key: true
  end
end
