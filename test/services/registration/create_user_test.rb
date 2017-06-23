require 'test_helper'

class Registration::CreateUserTest < ActiveSupport::TestCase

  test "call success" do
    params = attributes_for(:user_unconfirmed)
    service = Registration::CreateUser.new(params)
    result = service.call

    assert result.success?
    assert_instance_of User, result.data
  end

  test "call error" do
    create(:user, email: 'foo@bar.com')
    params = attributes_for(:user_unconfirmed, email: 'foo@bar.com')
    service = Registration::CreateUser.new(params)
    result = service.call

    assert_not result.success?
    assert_instance_of UserForm, result.error
  end

end
