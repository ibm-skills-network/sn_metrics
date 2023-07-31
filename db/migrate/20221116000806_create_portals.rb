class CreatePortals < ActiveRecord::Migration[7.0]
  def change
    create_table :portals do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :domain
      t.string :managers, array: true
      t.integer :total_learners
      t.jsonb :learners_data
      t.integer :total_enrollments
      t.jsonb :enrollments_data
      t.integer :total_completions
      t.jsonb :completions_data
      t.integer :total_certificates
      t.jsonb :certificates_data
      t.datetime :last_login
      t.datetime :last_join
      t.integer :installed_catalog_items
      t.integer :installed_non_catalog_items
      t.integer :outdated_catalog_items

      t.timestamps
    end
    add_index :portals, :name, unique: true
    add_index :portals, :slug, unique: true
    add_index :portals, :managers, using: 'gin'
  end
end
