class AddFreeToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :free, :boolean, default: false
    add_reference :user_events, :category, index: true, foreign_key: true

    create_table :categories_user_events do |t|
      t.belongs_to :user_event, index: true
      t.belongs_to :category, index: true
    end
  end
end
