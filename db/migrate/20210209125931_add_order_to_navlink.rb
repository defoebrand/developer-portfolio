class AddOrderToNavlink < ActiveRecord::Migration[6.0]
  def change
    add_column :nav_links, :order, :integer
  end
end
