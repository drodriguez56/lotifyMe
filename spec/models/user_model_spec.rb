require 'rails_helper'

describe User do
  xit "should be associated with picks" do
    user = User.new(:picks => nil)
    user.should_not be_valid
  end

  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(User.all).not_to include user
  end
end
