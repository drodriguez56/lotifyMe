require 'rails_helper'

describe User do
  xit "should be associated with picks" do
    user = User.new(:picks => nil)
    user.should_not be_valid
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
