class ChangeImagelinkToimageLink < ActiveRecord::Migration
  def change
    rename_column :events, :imagelink, :image_link
    rename_column :events, :imagealt, :imageAlt
  end
end
