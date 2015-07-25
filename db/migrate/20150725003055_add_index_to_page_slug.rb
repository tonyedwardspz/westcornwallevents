class AddIndexToPageSlug < ActiveRecord::Migration
  def change
    def change
    add_index :pages, :slug, unique: true
  end
  end
end
