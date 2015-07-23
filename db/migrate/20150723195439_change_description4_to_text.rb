class ChangeDescription4ToText < ActiveRecord::Migration
  def change
    change_column :events, :description4, :text
  end
end
