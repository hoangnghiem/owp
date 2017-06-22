require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "assoc" do
    merchant = create(:merchant)
    puts merchant.inspect
    puts merchant.owner.inspect
  end
end
