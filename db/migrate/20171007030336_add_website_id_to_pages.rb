class AddWebsiteIdToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :website_id, :bigint
  end
end
