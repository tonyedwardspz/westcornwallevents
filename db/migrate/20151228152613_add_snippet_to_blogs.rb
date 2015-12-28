class AddSnippetToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :snippet, :string
  end
end
