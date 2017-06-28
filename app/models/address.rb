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

  validates :street, :country, :state, :city, :zip, presence: true

  def ==(other_address)
    self.attributes == other_address.attributes
  end
  
end
