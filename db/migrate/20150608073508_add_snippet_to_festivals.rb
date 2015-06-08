class AddSnippetToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :snippet, :string
  end
end
