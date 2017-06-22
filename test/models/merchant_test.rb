require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "add admin" do
    tutu = merchants(:tutu)
    new_admin = User.new(email: 'foo@bar.com', first_name: 'Foo', last_name: 'Bar', password: '123123')
    tutu.admins << new_admin
    assert tutu.admins.count == 2
  end
end
