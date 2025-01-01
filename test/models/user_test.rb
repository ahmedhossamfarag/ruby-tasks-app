require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "test user uniqueness" do
    user = User.new(username: "ahmed", password: "password")
    assert_not user.valid?
  end
end
