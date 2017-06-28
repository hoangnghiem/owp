class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slug
      t.jsonb :addresses, null: false, default: []

      t.timestamps
    end

    add_index :companies, :slug, unique: true
    add_index :companies, :addresses, using: :gin
  end
end
