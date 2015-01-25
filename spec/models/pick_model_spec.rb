require 'rails_helper'

describe Pick do
   it "is valid with numbers, game, draw_date" do
    pick = Pick.new(
      number:"313577796306",
      game: "powerball",
      draw_date: "2015-01-12 03:11:34")
    expect(pick).to be_truthy
   end

   it "is invalid without numbers" do
    pick = Pick.new(
      number: nil,
      game: "powerball",
      draw_date: "2015-01-12 03:11:34")
    expect(Pick.all).not_to include pick
   end

   it "is invalid without game" do
      pick = Pick.new(
      number: "042017591206",
      game: nil,
      draw_date: "2015-01-12 03:11:34")
    expect(Pick.all).not_to include pick
   end

   it "is invalid with draw_date" do
      pick = Pick.new(
      number: "042017591206",
      game: "powerball",
      draw_date: nil)
    expect(Pick.all).not_to include pick
   end

   xit "does not allow duplicate emails" do
    pick = Pick.new(
      number: "042017591202",
      game: "powerball",
      draw_date: "2015-01-12 03:11:34",
      email: "pickTest@test.com")
    picky = Pick.new(
      number: "342047591204",
      game: "powerball",
      draw_date: "2015-01-12 03:11:34",
      email: "pickTest@test.com")
    expect(Pick.all).not_to include picky
   end

   it "updates pick.result correctly" do
     create(:draw)
     pick = create(:jackpot_pick)
     expect(pick.result).to eq('JACKPOT!!')
   end
end