class ChangeDrawDateToDatetypeInDraw < ActiveRecord::Migration
  def change
    remove_column :draws, :draw_date, :string, null: false
    add_column :draws, :draw_date, :datetime, null: false
  end
end
