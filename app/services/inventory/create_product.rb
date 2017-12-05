class Inventory::CreateProduct < BaseService

  def initialize(params)
    @params = params
  end

  def call
    form = ProductForm.new(params)

    if form.valid?
      product = form.product
      product.save!
      Success.new(product)
    else
      Error.new(form)
    end
  end

  private
  attr_reader :params
  
end
