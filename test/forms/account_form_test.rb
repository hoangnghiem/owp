require 'test_helper'

class AccountFormTest < ActiveSupport::TestCase

  test "valid" do
    params = {
      user: attributes_for(:user_unconfirmed),
      company: attributes_for(:company),
      address: attributes_for(:address)
    }
    form = AccountForm.new(params)
    valid = form.valid?

    assert valid
  end

  test "invalid" do
    params = {
      user: {},
      company: {},
      address: {}
    }
    form = AccountForm.new(params)
    valid = form.valid?
    puts form.inspect
    puts form.errors.inspect

    assert_not valid
  end

end
