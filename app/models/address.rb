class Address
  include ActiveModel::Model 
  include Virtus.model

  attribute :street, Attributes::StrippedString
  attribute :apt, Attributes::StrippedString # apt, suite, (optional)
  attribute :suburb, Attributes::StrippedString # (optional)
  attribute :country, String
  attribute :state, String
  attribute :city, Attributes::StrippedString
  attribute :zip, Attributes::StrippedString

  validates :street, :country, :city, :zip, presence: true
  validate :state_present_if_country_has_subregions

  def ==(other_address)
    self.attributes == other_address.attributes
  end

  def self.load(json)
    address = self.new
    unless json.nil?
      attrs = JSON.parse(json)
      address.attributes = attrs
    end
    address
  end

  def self.dump(address)
    address.attributes.to_json if address
  end

  def self.fake
    country = Carmen::Country.all.map { |c| c.alpha_2_code}.sample
    Address.new(
      street: Faker::Address.street_address,
      country: country,
      state: (country ? Carmen::Country.coded(country).subregions.map { |s| s.code}.sample : nil),
      city: Faker::Address.city,
      zip: Faker::Address.zip
    )
  end

  private

  def state_present_if_country_has_subregions
    if country.present? && Carmen::Country.coded(country).subregions.any?
      errors.add(:state, :blank) if state.blank?
    end
  end
  
end
