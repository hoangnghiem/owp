class RegistrationForm < BaseForm
  attribute :email, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :merchant_name, String
  attribute :password, String

  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :merchant_name, presence: true
  validates :password, presence: true

  validate :email_cannot_taken
  validate :merchant_name_cannot_taken
  
  def user_attributes
    attributes.slice(:email, :first_name, :last_name, :password)
  end
  
  def merchant_attributes
    { name: merchant_name }
  end

  protected

  def clean_attributes
    super
    self.email = email && email.downcase
    self.first_name = first_name && first_name.titleize
    self.last_name = last_name && last_name.titleize
    self.merchant_name = merchant_name && merchant_name.titleize
  end

  private

  def email_cannot_taken
    errors.add(:email, :taken) if User.where(email: email).exists?
  end

  def merchant_name_cannot_taken
    errors.add(:merchant_name, :taken) if Merchant.where(name: merchant_name).exists?
  end
end
