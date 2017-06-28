class UserForm < BaseForm
  attribute :email, Attributes::DowncasedString
  attribute :first_name, Attributes::TitleizedString
  attribute :last_name, Attributes::TitleizedString
  attribute :password, Attributes::StrippedString

  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validate :email_cannot_taken

  private

  def email_cannot_taken
    errors.add(:email, :taken) if User.where(email: email).exists?
  end

end
