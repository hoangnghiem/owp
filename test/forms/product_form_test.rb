require 'test_helper'

class ProductFormTest < ActiveSupport::TestCase

  test "initialize with id" do
    existing_product = create(:product)
    form = ProductForm.new(id: existing_product.id)

    assert form.persisted?
  end

  test "valid" do
  end

  test "invalid with empty data" do
  end

  test "invalid with existence" do
  end

end
