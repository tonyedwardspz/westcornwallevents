class AddDescription4ToEvents < ActiveRecord::Migration
  def change
    add_column :events, :description4, :string
  end
end
