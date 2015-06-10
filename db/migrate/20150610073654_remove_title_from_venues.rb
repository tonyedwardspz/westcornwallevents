class RemoveTitleFromVenues < ActiveRecord::Migration
  def change
    remove_column :venues, :title
  end
end
