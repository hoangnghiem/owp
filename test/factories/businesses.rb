FactoryGirl.define do
  factory :business do
    name { Faker::Company.name }

    factory :business_with_address do
      address { Address.fake }
    end

    after(:create) do |business|
      business.admins << FactoryGirl.create(:user)
    end
  end
end
