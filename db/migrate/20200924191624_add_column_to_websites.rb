class AddColumnToWebsites < ActiveRecord::Migration[6.0]
  def change
    add_column :websites, :image, :string
  end
end
