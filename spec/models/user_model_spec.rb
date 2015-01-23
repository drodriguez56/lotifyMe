require 'rails_helper'

describe User do
  xit "should be associated with picks" do
    user = User.new(:picks => nil)
    no_user_team.should_not be_valid
  end


end
