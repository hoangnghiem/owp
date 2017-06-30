class WholesalerForm < BaseForm
  attribute :business_name, Attributes::TitleizedString
  attribute :url, Attributes::SluggedString

  attribute :user_form, UserForm, default: UserForm.new
  attribute :address_form, Address, default: Address.new

  delegate :email, :first_name, :last_name, :password, to: :user_form
  delegate :street, :apt, :suburb, :country, :state, :city, :zip, to: :address_form

  validates :business_name, :url, presence: true
  validate do
    [user_form, address_form].each do |form|
      unless form.valid?
        form.errors.each do |key, values|
          errors.add(key, values)
        end
      end
    end
  end

  def initialize(options={})
    super(options)
    user_form.attributes = options.slice(:email, :first_name, :last_name, :password)
    address_form.attributes = options.slice(:street, :apt, :suburb, :country, :state, :city, :zip)
  end

  def user
    @user ||= User.new(user_form.attributes)
  end

  def business
    @business ||= Business.new(name: business_name, slug: url, address: address_form)
  end

end
