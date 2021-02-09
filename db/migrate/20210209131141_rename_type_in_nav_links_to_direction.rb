class RenameTypeInNavLinksToDirection < ActiveRecord::Migration[6.0]
  def change
    rename_column :nav_links, :type, :direction
  end
end
