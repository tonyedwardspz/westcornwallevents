class AddAttributesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :date, :date
    add_column :events, :dateend, :date
    add_column :events, :title, :string
    add_column :events, :location, :string
    add_column :events, :link, :string
    add_column :events, :linktitle, :string
    add_column :events, :time, :string
    add_column :events, :more_link, :string
    add_column :events, :moreTitle, :string
    add_column :events, :description, :string
    add_column :events, :description2, :string
    add_column :events, :description3, :string
    add_column :events, :imagelink, :string
    add_column :events, :imagealt, :string
  end
end
