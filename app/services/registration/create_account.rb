# Merchant sign up
class Registration::CreateAccount < BaseService

  def initialize(params)
    @params = params
  end

  def call
    form = UserForm.new(User.new)

    if form.validate(params)
      form.save
      Success.new(form.model)
    else
      Error.new(form)
    end
  end

  private
  attr_reader :params

end
