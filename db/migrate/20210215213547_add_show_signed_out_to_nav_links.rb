class AddShowSignedOutToNavLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :nav_links, :show_signed_out, :boolean
  end
end
