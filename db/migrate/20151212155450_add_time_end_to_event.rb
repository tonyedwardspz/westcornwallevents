class AddTimeEndToEvent < ActiveRecord::Migration
  def change
    add_column :events, :time_end, :string
  end
end
