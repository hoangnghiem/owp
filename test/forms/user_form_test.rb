require 'test_helper'

class UserFormTest < ActiveSupport::TestCase
  test "valid" do
    params = {
      first_name: 'hoang', 
      last_name: 'nghiem', 
      email: 'newuser@gmail.com',
      password: '123123'
    }
    form = UserForm.new(params)
    valid = form.valid?
    assert valid
  end

  test "empty data" do
    params = {}
    form = UserForm.new(params)
    valid = form.valid?
    assert_not valid
    assert_equal 5, form.errors.count
  end

  test "email existed" do
    params = {
      first_name: 'hoang', 
      last_name: 'nghiem', 
      email: 'hoangnghiem1711@gmail.com',
      password: '123123'
    }
    form = UserForm.new(params)
    valid = form.valid?
    assert_not valid
    assert_equal 1, form.errors.count
  end
end
