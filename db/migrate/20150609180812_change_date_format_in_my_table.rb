class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :festivals, :summary, :text
  end
end
