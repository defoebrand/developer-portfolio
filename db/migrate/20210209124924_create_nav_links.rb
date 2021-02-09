class CreateNavLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :nav_links do |t|
      t.string :name
      t.string :url
      t.string :icon

      t.timestamps
    end
  end
end
