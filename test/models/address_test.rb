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
    assert_equal 4, address.errors.count
  end

  test "validate country with states" do
    address = Address.new(country: 'AU')
    valid = address.valid?

    assert_not valid
    assert_equal 4, address.errors.count
  end

  test "validate country without states" do
    address = Address.new(country: 'AI')
    valid = address.valid?

    assert_not valid
    assert_equal 3, address.errors.count
  end

  # test "serializer #load" do
  #   address = Address.load(address_attrs = attributes_for(:address))
  #   assert_instance_of Address, address
  # end
  #
  # test "serializer #dump" do
  #   Address.dump(build(:address))
  # end

end
