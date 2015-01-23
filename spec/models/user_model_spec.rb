require 'rails_helper'

describe User do
  it "should be associated with picks" do
    user = User.create(
      username:"lemons",
      password_digest: "peelinglemons",
      email: 2)
    pick = user.picks.create(
      number: "342047591204",
      game: "powerball",
      draw_date: "01/01/15")
    expect(pick).to be_truthy
  end

  it "is invalid without an email address" do
    user = User.new(
      username:"honeybadger",
      password_digest: "ilikedacoco",
      email: nil)
    user.valid?
    expect(User.all).not_to include user
  end


  it "is valid because password is long enough" do
    user = User.create(
      username:"lemons",
      password_digest: "peelinglemons",
      email: 2)
    expect(User.all).to include user
  end
end
