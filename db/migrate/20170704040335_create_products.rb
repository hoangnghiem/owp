class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.text :description
      t.references :business, index: true, foreign_key: true

      t.timestamps
    end
  end
end
