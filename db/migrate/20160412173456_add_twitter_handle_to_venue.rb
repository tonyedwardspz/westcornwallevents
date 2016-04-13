class AddTwitterHandleToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :twitter_handle, :string
  end
end
