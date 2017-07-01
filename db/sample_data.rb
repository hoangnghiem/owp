result = Auth::CreateWholesaler.new({
  business_name: 'Tutudumonde',
  url: 'tutudumonde',
  email: 'peter@rembeckjones.com',
  password: '123123',
  first_name: 'Peter',
  last_name: 'Jones',
  street: Faker::Address.street_address,
  country: 'AU',
  state: Carmen::Country.coded('AU').subregions.map { |s| s.code }.sample,
  city: Faker::Address.city,
  zip: Faker::Address.zip
}).call

result.data.confirm
