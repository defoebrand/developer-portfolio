class AddColumnsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :websites, :code, :string
    add_column :apps, :code, :string
    add_column :games, :code, :string
  end
end
