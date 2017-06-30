class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.references :business, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role

      t.timestamps
    end

    add_index :memberships, [:business_id, :user_id], unique: true
    add_index :memberships, [:user_id, :business_id], unique: true
  end
end
