class AddCreatedAtToBlog < ActiveRecord::Migration
  def change
    add_timestamps(:blogs)
  end
end
