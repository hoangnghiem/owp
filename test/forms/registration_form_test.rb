require 'test_helper'

class RegistrationFormTest < ActiveSupport::TestCase

  test "valid" do
    params = attributes_for(:user_unconfirmed, merchant_name: 'A')
    form = RegistrationForm.new(params)
    valid = form.valid?

    assert valid
  end

  test "invalid with empty data" do
    form = RegistrationForm.new({})
    valid = form.valid?

    assert_not valid
    assert_equal 6, form.errors.count
  end

  test "invalid with existence" do
    merchant = create(:merchant, name: 'Tutu')
    owner = merchant.owner
    params = attributes_for(:user_unconfirmed, email: owner.email, merchant_name: merchant.name)
    form = RegistrationForm.new(params)
    valid = form.valid?

    assert_not valid
    assert_equal 2, form.errors.count
    assert_equal :taken, form.errors.details[:email][0][:error]
    assert_equal :taken, form.errors.details[:merchant_name][0][:error]
  end  

end
