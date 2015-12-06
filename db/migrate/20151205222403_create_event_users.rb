class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
    end
  end
end
