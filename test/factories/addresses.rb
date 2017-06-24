FactoryGirl.define do
  factory :address do
    street { Faker::Address.street_address }
    country { Carmen::Country.all.map { |c| c.alpha_2_code}.sample }
    state { country ? Carmen::Country.coded(country).subregions.map { |s| s.code}.sample : nil }
    city { Faker::Address.city }
    zip { Faker::Address.zip }
  end
end
