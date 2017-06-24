require 'test_helper'

class AddressDecoratorTest < Draper::TestCase

  test "display_country" do
    address = build(:address, country: 'US')
    decorated_address = AddressDecorator.decorate(address)

    assert_equal 'United States', decorated_address.display_country
  end

  test "display_country with empty country" do
    address = build(:address, country: nil)
    decorated_address = AddressDecorator.decorate(address)

    assert_equal '', decorated_address.display_country
  end

  test "display_state" do
    address = build(:address, country: 'US', state: 'AK')
    decorated_address = AddressDecorator.decorate(address)

    assert_equal 'Alaska', decorated_address.display_state
  end

  test "display_state with empty country" do
    address = build(:address, country: nil, state: 'AK')
    decorated_address = AddressDecorator.decorate(address)

    assert_equal '', decorated_address.display_state
  end

  test "display_state with empty state" do
    address = build(:address, country: nil, state: nil)
    decorated_address = AddressDecorator.decorate(address)

    assert_equal '', decorated_address.display_state
  end

end
