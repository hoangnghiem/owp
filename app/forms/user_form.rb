class UserForm < BaseForm
  attribute :email, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :password, :string

  validates :email, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true

  validate :email_cannot_taken

  def attributes
    instance_values.symbolize_keys!.slice(:email, :first_name, :last_name, :password)
  end

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
