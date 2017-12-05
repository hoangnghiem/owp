class Inventory::UpdateProduct < BaseService
  attr_reader :business, :user, :form, :params

  def initialize(business, user, form, params)
    @business = business
    @user = business
    @form = form
    @params = params
  end

  def call
    if form.valid?
      product = form.product
      product.update_attributes(params)
      product.save!
      Success.new(product)
    else
      Error.new(form)
    end
  end

  
end
