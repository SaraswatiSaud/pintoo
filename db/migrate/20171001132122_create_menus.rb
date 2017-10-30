class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
