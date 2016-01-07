class CreateBlogsFestivals < ActiveRecord::Migration
  def change
    create_table :blogs_festivals do |t|
      t.belongs_to :blog, index: true
      t.belongs_to :festival, index: true
    end
  end
end
