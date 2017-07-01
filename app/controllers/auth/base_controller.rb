class Auth::BaseController < ApplicationController
  layout 'auth'

  protected

  def after_sign_in_path_for(user)
    user_business_count = user.businesses.count
    case user_business_count
    when 0
      root_path
    when 1
      dashboard_path(ws: user.businesses.first)
    when 2..100
      root_path
    else
      raise "Invalid user data"
    end
  end

end
