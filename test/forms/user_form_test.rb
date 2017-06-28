require 'test_helper'

class UserFormTest < ActiveSupport::TestCase

  test "valid" do
    params = attributes_for(:user_unconfirmed)
    form = UserForm.new(params)
    valid = form.valid?

    assert valid
  end

  test "invalid with empty data" do
    params = {}
    form = UserForm.new(params)
    valid = form.valid?

    assert_not valid
    assert_equal 5, form.errors.count
  end

  test "invalid with existence" do
    create(:user, email: 'Hoangnghiem1711@gmail.com')
    params = attributes_for(:user_unconfirmed, email: 'hoangnghiem1711@gmail.com')
    form = UserForm.new(params)
    valid = form.valid?

    assert_not valid
    assert_equal 1, form.errors.count
    assert_equal :taken, form.errors.details[:email][0][:error]
  end

end
