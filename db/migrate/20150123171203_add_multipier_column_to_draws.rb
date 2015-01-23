class AddMultipierColumnToDraws < ActiveRecord::Migration
  def change
    add_column :draws, :multiplier, :integer, null: false
  end
end
