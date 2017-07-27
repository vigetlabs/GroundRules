class AddNotNullConstraintForPosition < ActiveRecord::Migration[5.1]
  def up
    change_column :devices, :position, :integer, null: false
    change_column :device_problems, :position, :integer, null: false
    change_column :roasts, :position, :integer, null: false
    change_column :roast_brands, :position, :integer, null: false
  end
  def down
    change_column :devices, :position, :integer, null: true
    change_column :device_problems, :position, :integer, null: true
    change_column :roasts, :position, :integer, null: true
    change_column :roast_brands, :position, :integer, null: true
  end
end
