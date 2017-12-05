FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    business
  end
end
