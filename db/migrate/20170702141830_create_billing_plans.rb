class CreateBillingPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :billing_plans do |t|
      t.string :stripe_id
      t.string :name
      t.string :currency
      t.monetize :price
      t.string :interval
      t.boolean :displayable, default: true
      t.boolean :highlight, default: false
      t.jsonb :quota, null: false, default: '{}'
      t.integer :trial_period_days, default: 0

      t.timestamps
    end
  end
end
