class AddImageSecureTokenToUserEvent < ActiveRecord::Migration
  def change
    add_column :user_events, :image_secure_token, :string
  end
end
