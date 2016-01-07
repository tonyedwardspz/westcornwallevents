class CreateBlogsAndParts < ActiveRecord::Migration
  def change
    create_table :blogs_events do |t|
      t.belongs_to :blog, index: true
      t.belongs_to :event, index: true
    end
  end
end
