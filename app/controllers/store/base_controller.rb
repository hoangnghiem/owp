class Store::BaseController < ApplicationController
  before_action :authenticate_user!

  helper_method :current_business

  protected

  def default_url_options(options={})
    options.merge(ws: current_business.slug)
  end

  def current_business
    @current_business ||= Business.friendly.find(params[:ws])
  end

end
