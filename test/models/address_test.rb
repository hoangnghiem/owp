require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  test "equality" do
    address_attrs = attributes_for(:address)

    address1 = Address.new(address_attrs)
    address2 = Address.new(address_attrs)

    assert address1 == address2
  end

  test "validation" do
    address = Address.new
    valid = address.valid?

    assert_not valid
    assert_equal 5, address.errors.count
  end

end
