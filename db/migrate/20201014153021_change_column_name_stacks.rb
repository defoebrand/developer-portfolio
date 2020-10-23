class ChangeColumnNameStacks < ActiveRecord::Migration[6.0]
  def change
    rename_column :stacks, :type, :name
  end
end
