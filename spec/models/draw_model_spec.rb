require 'rails_helper'

describe Draw do
  it "is valid with a number and draw_date" do
    draw = Draw.new(
      number: "11,23,33,04,20,24",
      draw_date: "2015-01-30")
    expect(draw).to be_truthy
  end
end
