# Merchant sign up
class Auth::CreateWholesaler< BaseService

  def initialize(params)
    @params = params
  end

  def call
    form = WholesalerForm.new(params)

    if form.valid?
      user = form.user
      business = form.business

      ActiveRecord::Base.transaction do
        business.save!
        user.save!
        business.admins << user
      end

      Success.new(user)
    else
      Error.new(form)
    end
  end

  private
  attr_reader :params

end
