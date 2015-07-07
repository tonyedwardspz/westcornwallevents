class ChangeContentFormatInVenues < ActiveRecord::Migration
  def change
    change_column :venues, :content, :text
  end
end
