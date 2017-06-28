class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role

      t.timestamps
    end

    add_index :memberships, [:company_id, :user_id], unique: true
    add_index :memberships, [:user_id, :company_id], unique: true
  end
end
