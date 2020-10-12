class AddColumnsToWebsites < ActiveRecord::Migration[6.0]
  def change
    add_column :websites, :url, :string
    add_column :websites, :title, :string
    add_column :websites, :description, :text
  end
end
