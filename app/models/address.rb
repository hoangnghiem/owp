class Address
  include ActiveModel::Model 
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  include Virtus.model

  attribute :street, String
  attribute :apt, String # apt, suite, (optional)
  attribute :suburb, String # (optional)
  attribute :country, String
  attribute :state, String
  attribute :city, String
  attribute :zip, String

  validates :street, :country, :state, :city, :zip, presence: true

  def ==(other_address)
    self.attributes == other_address.attributes
  end
  
end
