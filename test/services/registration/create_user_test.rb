require 'test_helper'

class Registration::CreateUserTest < ActiveSupport::TestCase

  test "call success" do
    params = {
      first_name: 'Foo', 
      last_name: 'Bar', 
      email: 'newuser@gmail.com', 
      password: '123123'
    }
    service = Registration::CreateUser.new(params)
    result = service.call
    assert result.success?
    assert_instance_of User, result.data
  end

  test "call error" do
    params = {
      first_name: 'Hoang', 
      last_name: 'Nghiem', 
      email: 'hoangnghiem1711@gmail.com', 
      password: '123123'
    }
    service = Registration::CreateUser.new(params)
    result = service.call
    assert_not result.success?
    assert_instance_of UserForm, result.error
  end

end
