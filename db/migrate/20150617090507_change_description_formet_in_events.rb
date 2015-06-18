class ChangeDescriptionFormetInEvents < ActiveRecord::Migration
  def change
    change_column :events, :description, :text
    change_column :events, :description2, :text
    change_column :events, :description3, :text
  end
end
