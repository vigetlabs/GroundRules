class AddNotNullConstraintToSlug < ActiveRecord::Migration[5.1]
  def up
    change_column :devices, :slug, :string, null: false
  end
  def down
    change_column :devices, :slug, :string, null: true
  end
end
