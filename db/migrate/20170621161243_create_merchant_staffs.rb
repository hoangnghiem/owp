class CreateMerchantStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :merchant_staffs do |t|
      t.references :merchant, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :role, default: 0 # admin

      t.timestamps
    end
  end
end
