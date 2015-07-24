class AddUrlTitleToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :LinkAlt, :string
  end
end
