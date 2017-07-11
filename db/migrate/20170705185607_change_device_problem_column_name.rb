class ChangeDeviceProblemColumnName < ActiveRecord::Migration[5.1]
  def up
    remove_index :device_problems, :problem
    rename_column :device_problems, :problem, :statement
  end
  def down
    rename_column :device_problems, :statement, :problem
  end
end
