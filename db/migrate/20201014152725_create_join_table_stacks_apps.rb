class CreateJoinTableStacksApps < ActiveRecord::Migration[6.0]
  def change
    create_join_table :stacks, :apps do |t|
    end
  end
end
