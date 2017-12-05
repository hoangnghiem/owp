require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  test "the truth" do
    v = create(:variant, currency: 'AUD')
    puts v.price.inspect
    puts v.retail_price.inspect
    puts v.cost.inspect
  end
end
