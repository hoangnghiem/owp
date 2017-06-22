require 'test_helper'

class RegistrationFormTest < ActiveSupport::TestCase
  test "valid" do
    params = {
      first_name: 'hoang', 
      last_name: 'nghiem', 
      email: 'newuser@gmail.com',
      merchant_name: 'New Merchant',
      password: 'New Merchant'
    }
    form = RegistrationForm.new(params)
    valid = form.valid?
    assert valid
  end

  test "invalid" do
    params = {
      first_name: 'hoang', 
      last_name: 'nghiem', 
      email: 'hoangnghiem1711@gmail.com',
      merchant_name: 'Tutudumonde',
      password: '123123'
    }
    form = RegistrationForm.new(params)
    valid = form.valid?
    assert_not valid
  end
end
