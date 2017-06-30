require 'test_helper'

class Auth::CreateWholesalerTest < ActiveSupport::TestCase

  test "call success" do
    params = {business_name: Faker::Company.name, url: Faker::Company.name}.merge(attributes_for(:user_unconfirmed)).merge(attributes_for(:address))
    service = Auth::CreateWholesaler.new(params)
    result = service.call

    unless result.success?
      puts result.inspect
    end

    assert result.success?
    assert_instance_of User, result.data
    assert_not result.data.new_record?
  end

  test "call error" do
    service = Auth::CreateWholesaler.new({})
    result = service.call

    assert_not result.success?
    assert_instance_of WholesalerForm, result.error
  end

end
