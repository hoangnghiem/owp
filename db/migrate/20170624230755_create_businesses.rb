class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :slug
      t.jsonb :address, null: false, default: '{}'
      t.jsonb :locale_setting, null: false, default: '{}'

      t.timestamps
    end

    add_index :businesses, :slug, unique: true
  end
end
