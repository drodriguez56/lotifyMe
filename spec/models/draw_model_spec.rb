require 'rails_helper'

describe Draw do
  it "is valid with a number and draw_date" do
    draw = Draw.new(
      numbers: "11,23,33,04,20,24",
      draw_date: "2015-01-30")
    expect(draw).to be_truthy
  end

  it "is invalid without a number" do
    draw = Draw.new(numbers: nil)
    expect(Draw.all).not_to include draw
  end

  it "is invalid without a draw_date" do
    draw = Draw.new(draw_date: nil)
    expect(Draw.all).not_to include draw
  end
end
