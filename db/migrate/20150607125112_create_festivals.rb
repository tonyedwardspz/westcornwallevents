class CreateFestivals < ActiveRecord::Migration
  def change
    create_table :festivals do |t|
      t.string :title
      t.date :date
      t.date :end_date
      t.text :content
      t.string :image
      t.string :image_alt
      t.string :image2
      t.string :image2_alt
      t.string :video1
      t.string :video2
      t.string :meta_title
      t.string :meta_description

      t.timestamps null: false
    end
  end
end
