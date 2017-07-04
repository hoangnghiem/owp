class Store::BaseController < ApplicationController
  layout 'store'

  before_action :authenticate_user!

  helper_method :current_business

  protected

  def default_url_options(options={})
    options.merge(ws: current_business.slug)
  end

  def current_business
    @current_business ||= Business.friendly.find(params[:ws])
  end

  def add_breadcrumb(name, url = '')
    @breadcrumbs ||= [] 
    url = eval(url) if url =~ /_path|_url/
    @breadcrumbs << [name, url] 
  end

  def self.add_breadcrumb(name, url, options = {})
    before_action options do |controller| 
      controller.send(:add_breadcrumb, name, url) 
    end
  end

end
