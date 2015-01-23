class ChangeMultiplierToBooleanInPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :multiplier, :integer
    add_column :picks, :multiplier, :boolean
  end
end
