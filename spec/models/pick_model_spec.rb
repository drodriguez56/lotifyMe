require 'rails_helper'

describe Pick do
   it "is valid with numbers, game, draw_date" do
    pick = Pick.new(
      numbers:"313577796306",
      game: "powerball",
      draw_date: "01/13/15")
    expect(pick).to be_truthy
   end

   it "is invalid without numbers" do
    pick = Pick.new(
      numbers: nil,
      game: "powerball",
      draw_date: "01/22/15")
    expect(Pick.all).not_to include pick
   end

   it "is invalid without game" do
      pick = Pick.new(
      numbers: "042017591206",
      game: nil,
      draw_date: "01/22/15")
    expect(Pick.all).not_to include pick
   end

   it "is invalid with draw_date"
   it "does not allow duplicate emails"
end