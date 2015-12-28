class AddFieldsToBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |b|
      b.string :title
      b.text :content
      b.date :date_published
      b.string :image
      b.string :blogs, :image_alt
      b.text :description
    end
  end
end
