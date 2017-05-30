class CreateWebsites < ActiveRecord::Migration[5.1]
  def change
    create_table :websites do |t|
      t.string :name
      t.string :subdomain
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :websites, :subdomain, unique: true
  end
end
