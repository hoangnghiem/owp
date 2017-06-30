# Normal user sign up
class Auth::CreateUser < BaseService

  def initialize(params)
    @params = params
  end

  def call
    form = UserForm.new(params)

    if form.valid?
      user = form.user
      user.save!
      Success.new(user)
    else
      Error.new(form)
    end
  end

  private
  attr_reader :params

end
