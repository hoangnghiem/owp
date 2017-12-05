class ProductForm < BaseForm
  attribute :id, Integer
  attribute :name, Attributes::TitleizedString
  attribute :code, Attributes::UpcasedString
  attribute :base_price, String
  attribute :description, Attributes::StrippedString

  validates :name, :code, presence: true

  def initialize(attr={})
    if attr[:id]
      @product = Product.find(attr[:id])
      self.attributes = @product.attributes
    else
      super(attr)
    end
  end

  def product
    @product ||= Product.new(attributes.except(:base_price))
  end
  alias_method :model, :product

  def persisted?
    model.persisted?
  end

end
