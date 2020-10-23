class CreateJoinTableStacksWebsites < ActiveRecord::Migration[6.0]
  def change
    create_join_table :stacks, :websites do |t|
    end
  end
end
