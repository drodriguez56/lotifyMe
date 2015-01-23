class ChangeDrawDateToDatetypeInPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :draw_date, :string, null: false
    add_column :picks, :draw_date, :datetime, null: false
  end
end
