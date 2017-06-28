FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }

    after(:create) do |company|
      company.admins << FactoryGirl.create(:user)
    end
  end
end
