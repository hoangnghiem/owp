require 'test_helper'

class WholesalerFormTest < ActiveSupport::TestCase

  test "valid" do
    params = {business_name: Faker::Company.name, url: Faker::Company.name}.merge(attributes_for(:user_unconfirmed)).merge(attributes_for(:address))
    form = WholesalerForm.new(params)
    valid = form.valid?

    assert valid
    assert_instance_of User, form.user
    assert_instance_of Business, form.business
  end

  test "invalid" do
    form = WholesalerForm.new({})
    valid = form.valid?

    assert_not valid
  end

end
