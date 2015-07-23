class CreateAdminVenues < ActiveRecord::Migration
  def change
    create_table :admin_venues do |t|

      t.timestamps null: false
    end
  end
end
