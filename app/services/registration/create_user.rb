# Normal user sign up
class Registration::CreateUser < BaseService

  def initialize(params)
    @params = params
  end

  def call
    form = UserForm.new(params)

    if form.valid?
      user = User.new(form.attributes)
      user.save
      Success.new(user)
    else
      Error.new(form)
    end
  end

  private
  attr_reader :params

end
