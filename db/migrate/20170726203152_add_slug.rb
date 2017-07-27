class AddSlug < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :slug, :string, null: false
  end
end
