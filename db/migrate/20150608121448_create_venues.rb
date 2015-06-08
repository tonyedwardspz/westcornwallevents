class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :title
      t.string :name
      t.string :phone
      t.string :email
      t.string :url
      t.string :address
      t.string :postcode
      t.string :image
      t.string :image_alt
      t.string :content

      t.timestamps null: false
    end
  end
end
