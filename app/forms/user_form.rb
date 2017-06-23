class UserForm < BaseForm
  attribute :email, String
  attribute :first_name, String
  attribute :last_name, String
  attribute :password, String

  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true

  validate :email_cannot_taken

  protected

  def clean_attributes
    super
    self.email = email && email.downcase
    self.first_name = first_name && first_name.titleize
    self.last_name = last_name && last_name.titleize
  end

  private

  def email_cannot_taken
    errors.add(:email, :taken) if User.where(email: email).exists?
  end

end
