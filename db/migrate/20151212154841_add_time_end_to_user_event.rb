class AddTimeEndToUserEvent < ActiveRecord::Migration
  def change
    add_column :user_events, :time_end, :string
  end
end
