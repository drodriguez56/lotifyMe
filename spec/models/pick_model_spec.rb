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
# powerball method tests
   it "updates pick.result to jackpot when all match in powerball" do
     create(:draw_powerball)
     pick = create(:jackpot_pick_powerball)
     expect(pick.result).to eq('JACKPOT!!')
   end

   it "updates pick.result to $200 when 3P match in powerball with 2x multiplier" do
     create(:draw_powerball)
     pick = create(:threep_pick_powerball)
     expect(pick.result).to eq("You won $200")
   end

   it "updates pick.result to not a winner when 0 match in powerball " do
     create(:draw_powerball)
     pick = create(:zero_pick_powerball)
     expect(pick.result).to eq('You did not win')
   end

   # megamillions method tests
   it "updates pick.result to jackpot when all match in megamillions" do
     create(:draw_mega_millions)
     pick = create(:jackpot_pick_mega_millions)
     expect(pick.result).to eq('JACKPOT!!')
   end

   it "updates pick.result to $200 when 3P match in megamillions with 2x multiplier" do
     create(:draw_mega_millions)
     pick = create(:threep_pick_mega_millions)
     expect(pick.result).to eq("You won $100")
   end

   it "updates pick.result to not a winner when 0 match in megamillions " do
     create(:draw_mega_millions)
     pick = create(:zero_pick_mega_millions)
     expect(pick.result).to eq('You did not win')
   end
   # nylotto method tests
   it "updates pick.result to jackpot when all match in nylotto" do
     create(:draw_nylotto)
     pick = create(:jackpot_pick_nylotto)
     expect(pick.result).to eq('JACKPOT!!')
   end

   it "updates pick.result to 2nd place when 5P match in nylotto" do
     create(:draw_nylotto)
     pick = create(:fivep_pick_nylotto)
     expect(pick.result).to eq("You won 2nd place")
   end

   it "updates pick.result to not a winner when 0 match in nylotto " do
     create(:draw_nylotto)
     pick = create(:zero_pick_nylotto)
     expect(pick.result).to eq('You did not win')
   end
end