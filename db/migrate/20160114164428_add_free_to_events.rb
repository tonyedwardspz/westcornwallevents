class AddFreeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :free, :boolean, default: false
  end
end
