class AddArchivedToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :archived, :boolean, default: false
  end
end
