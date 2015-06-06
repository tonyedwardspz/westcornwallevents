class AddColumsToFestival < ActiveRecord::Migration
  def change
    add_column :festivals, :title, :string
    add_column :festivals, :date, :date
    add_column :festivals, :enddate, :date
    add_column :festivals, :content, :text
    add_column :festivals, :image, :string
    add_column :festivals, :image_alt, :string
    add_column :festivals, :image2, :string
    add_column :festivals, :image2_alt, :string
    add_column :festivals, :video1, :string
    add_column :festivals, :video2, :string
    add_column :festivals, :meta_title, :string
    add_column :festivals, :meta_description, :string
  end
end
