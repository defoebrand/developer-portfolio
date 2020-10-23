class CreateJoinTableStacksGames < ActiveRecord::Migration[6.0]
  def change
    create_join_table :stacks, :games do |t|
    end
  end
end
