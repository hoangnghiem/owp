FactoryGirl.define do
  factory :variant do
    product
    sku { Faker::Code.asin }
    price_cents { 1000 }
    retail_price_cents { price_cents * 3 }
    cost_cents { price_cents / 2 }
    currency 'USD'
    weight_value 0.5
    weight_unit "lbs"
    length 1.2
    width 1.5
    height 1.8
    dimension_unit "mm"
  end
end
