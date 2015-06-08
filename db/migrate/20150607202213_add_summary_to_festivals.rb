class AddSummaryToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :summary, :string
  end
end
