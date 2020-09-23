class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|

      t.timestamps
    end
  end
end
