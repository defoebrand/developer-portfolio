class AddColumnsToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :url, :string
    add_column :games, :title, :string
    add_column :games, :description, :text
    add_column :games, :image, :string
  end
end
