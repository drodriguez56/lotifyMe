class AddDrawRefToPicks < ActiveRecord::Migration
  def change
    add_reference :picks, :draw, index: true
  end
end
