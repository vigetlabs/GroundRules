class ChangeDeviceProblemColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :device_problems, :problem, :statement
  end
end
