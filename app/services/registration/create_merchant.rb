# Setup merchant account along with user
# User who created merchant is default to owner of merchant
class Registration::CreateMerchant < BaseService

  def initialize(params)
    @params = params
  end

  def call
    form = RegistrationForm.new(params)

    if form.valid?
      merchant = Merchant.new(form.merchant_attributes)
      merchant.save

      user = User.new(form.user_attributes)
      merchant.admins << user

      Success.new(user)
    else
      Error.new(form)
    end
  end

  private
  attr_reader :params

end
