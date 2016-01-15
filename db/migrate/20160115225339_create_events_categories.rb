class CreateEventsCategories < ActiveRecord::Migration
  def change
    create_table :categories_events do |t|
      t.belongs_to :event, index: true
      t.belongs_to :category, index: true
    end
  end
end
