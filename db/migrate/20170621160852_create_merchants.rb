class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.string :address, :jsonb, default: '{}'

      t.timestamps
    end

    add_index :merchants, :name, unique: true
  end
end
