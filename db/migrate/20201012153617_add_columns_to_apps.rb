class AddColumnsToApps < ActiveRecord::Migration[6.0]
  def change
    add_column :apps, :url, :string
    add_column :apps, :title, :string
    add_column :apps, :description, :text
    add_column :apps, :image, :string
  end
end
