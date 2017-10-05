class AddSlugToWebsites < ActiveRecord::Migration[5.1]
  def change
    add_column :websites, :slug, :string
    add_index :websites, :slug
  end
end
