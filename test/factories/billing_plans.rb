FactoryGirl.define do
  factory :billing_plan, class: 'Billing::Plan' do
    stripe_id "MyString"
    name "MyString"
    currency "MyString"
    price_cents "MyString"
    interval "MyString"
  end
end
