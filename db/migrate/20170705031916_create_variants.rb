class CreateVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :variants do |t|
      t.references :product, foreign_key: true, index: true
      t.string :sku, index: true
      t.monetize :price
      t.monetize :retail_price
      t.monetize :cost
      t.string :currency
      t.decimal :weight_value
      t.string :weight_unit
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.string  :dimension_unit
      t.jsonb :options

      t.timestamps
    end
  end
end
