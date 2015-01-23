class FixPluralInNumberPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :numbers, :string, null: false
    add_column :picks, :number, :string, null: false
  end
end
