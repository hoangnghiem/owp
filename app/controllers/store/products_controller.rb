class Store::ProductsController < Store::BaseController
  add_breadcrumb I18n.t('store.products.shared.heading'), 'products_path', only: [:new, :edit]
  add_breadcrumb I18n.t('store.products.shared.edit'), nil, only: [:new, :edit]

  def index 
    
  end

  def new
    @form = ProductForm.new
  end

  def create
    
  end

  def edit
    @form = ProductForm.new(id: params[:id])
  end

  def update
    @form = ProductForm.new(id: params[:id])
    Inventory::UpdateProduct.new.call(@form, params[:product_form])
  end
  
end
