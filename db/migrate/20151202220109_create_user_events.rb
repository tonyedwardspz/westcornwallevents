class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.string :title
      t.date :date
      t.date :end_date
      t.string :location
      t.string :link
      t.string :image
      t.string :time
      t.text :description

      t.timestamps null: false
    end
  end
end
