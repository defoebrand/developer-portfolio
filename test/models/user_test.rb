require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @good_user = users(:good_user)
    @user_only_email = users(:user_only_email)
    @user_only_role = users(:user_only_role)
  end

  test 'new users with only name' do
    bad_user = User.new(name: 'BadUser')
    assert bad_user.invalid?
  end

  test 'new users with only email' do
    assert @user_only_email.invalid?
  end

  test 'new users with only role' do
    assert @user_only_role.invalid?
  end

  test 'new students with name and email' do
    assert @good_user.valid?
  end
end
