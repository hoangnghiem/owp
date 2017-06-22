require 'test_helper'

class Registration::CreateMerchantTest < ActiveSupport::TestCase

  test "call success" do
    params = {
      first_name: 'Foo', 
      last_name: 'Bar', 
      email: 'newuser@gmail.com', 
      merchant_name: 'New Merchant'
    }
    service = Registration::CreateMerchant.new(params)
    result = service.call
    assert result.success?
    assert_instance_of User, result.data
  end

  test "call error" do
    params = {
      first_name: 'Hoang', 
      last_name: 'Nghiem', 
      email: 'hoangnghiem1711@gmail.com', 
      merchant_name: 'Tutudumonde'
    }
    service = Registration::CreateMerchant.new(params)
    assert_not service.call.success?
  end

end
