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

  def user
    @user ||= User.new(attributes)
  end

  # Utility method to fill all form attributes with fake data for testing purpose
  def self.fake
    UserForm.new(
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: '123123'
    )
  end

  private

  def email_cannot_taken
    errors.add(:email, :taken) if User.where(email: email).exists?
  end

end
