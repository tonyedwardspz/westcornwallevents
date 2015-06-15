class AddFestivalRefToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :festival, index: true
  end
end
