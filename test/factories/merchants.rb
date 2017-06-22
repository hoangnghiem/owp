FactoryGirl.define do
  factory :merchant do
    name { Faker::Company.name }

    after(:create) do |merchant|
      merchant.admins << FactoryGirl.create(:user)
    end

  end
end
