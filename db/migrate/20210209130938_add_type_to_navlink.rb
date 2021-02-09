class AddTypeToNavlink < ActiveRecord::Migration[6.0]
  def change
    add_column :nav_links, :type, :string
  end
end
