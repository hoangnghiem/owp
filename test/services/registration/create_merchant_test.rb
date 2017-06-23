require 'test_helper'

class Registration::CreateMerchantTest < ActiveSupport::TestCase

  test "call success" do
    params = attributes_for(:user, merchant_name: 'New Merchant')
    service = Registration::CreateMerchant.new(params)
    result = service.call

    assert result.success?
    assert_instance_of User, result.data
  end

  test "call error" do
    create(:merchant, name: 'Tutu')
    params = attributes_for(:user_unconfirmed, merchant_name: 'Tutu')
    service = Registration::CreateMerchant.new(params)
    result = service.call

    assert_not result.success?
    assert_instance_of RegistrationForm, result.error
  end

end
