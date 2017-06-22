FactoryGirl.define do
  factory :user do
    first_name         { Faker::Name.first_name }
    last_name          { Faker::Name.last_name }
    email              { Faker::Internet.email }
    encrypted_password { User.new.send(:password_digest, "123123") }
    confirmed_at       { Time.current - 1.day }
  end
end
