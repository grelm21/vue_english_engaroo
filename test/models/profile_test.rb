require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should_not_save_profile" do
    profile = Profile.new
    assert profile.save, "Saved profile without name"
  end
end
