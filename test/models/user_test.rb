require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "thao", email: "thao@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be valid" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "      "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

end
