class CreateAdminPages < ActiveRecord::Migration
  def change
    create_table :admin_pages do |t|

      t.timestamps null: false
    end
  end
end
