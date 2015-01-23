class CreateDraws < ActiveRecord::Migration
  def change
    create_table :draws do |t|
      t.string :numbers, null: false
      t.string :draw_date, null: false
      t.string :game
      t.timestamps
    end
  end
end
