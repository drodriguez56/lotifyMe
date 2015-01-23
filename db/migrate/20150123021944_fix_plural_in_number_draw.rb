class FixPluralInNumberDraw < ActiveRecord::Migration
  def change
    remove_column :draws, :numbers, :string, null: false
    add_column :draws, :number, :string, null: false
  end
end
