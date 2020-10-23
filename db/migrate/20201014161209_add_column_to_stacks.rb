class AddColumnToStacks < ActiveRecord::Migration[6.0]
  def change
    add_column :stacks, :color, :string
  end
end
