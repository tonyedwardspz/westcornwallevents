class AddEventsToBlog < ActiveRecord::Migration
  def change
    add_reference :blogs, :event, index: true
    add_reference :blogs, :festival, index: true
  end
end
