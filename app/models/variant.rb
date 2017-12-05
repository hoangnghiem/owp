# == Schema Information
#
# Table name: variants
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  sku                :string
#  price_cents        :integer
#  retail_price_cents :integer
#  cost_cents         :integer
#  weight             :decimal(, )
#  weight_unit        :string
#  length             :decimal(, )
#  width              :decimal(, )
#  height             :decimal(, )
#  dimension_unit     :string
#  options            :jsonb
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Variant < ApplicationRecord
  belongs_to :product
  serialize :options, Hash

  monetize :price_cents, with_model_currency: :currency
  monetize :retail_price_cents, with_model_currency: :currency
  monetize :cost_cents, with_model_currency: :currency

  def dimension
    @dimension ||= Dimension.new(length: length, width: width, height: height, unit: dimension_unit)
  end

  def dimension=(dimension)
    self.length = dimension.length
    self.width = dimension.width
    self.height = dimension.height
    self.dimension_unit = dimension.unit
    @dimension = dimension
  end

  def weight
    @weight ||= Weight.new(value: weight_value, unit: weight_unit)
  end

  def weight=(weight)
    self.weight_value = weight.value
    self.weight_unit = weight.unit
    @weight = weight
  end
end
