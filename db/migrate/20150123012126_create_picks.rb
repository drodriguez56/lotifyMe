class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :numbers, null: false
      t.string :game, null: false
      t.string :draw_date, null:false
      t.string :result
      t.integer :multiplier
      t.references :user
      t.timestamps
    end
  end
end
