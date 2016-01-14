class ChangeTimestampsOnBlog < ActiveRecord::Migration
  Blog.where(updated_at: nil).update_all(updated_at: Time.now)
  Blog.where(created_at: nil).update_all(created_at: Time.now)

  def change
    change_column :blogs, :updated_at, :datetime, :null => false
    change_column :blogs, :created_at, :datetime, :null => false
  end
end
