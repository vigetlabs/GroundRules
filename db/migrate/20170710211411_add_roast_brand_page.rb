class AddRoastBrandPage < ActiveRecord::Migration[5.1]
  def change
    create_table :roast_brands do |t|
      t.string :brand_name, null: false
      t.string :roast_name, null: false
      t.string :image_url, null: false
      t.integer :roast_id, null: false
      t.timestamps
    end
    add_index :roast_brands, :roast_id
    add_foreign_key :roast_brands, :roasts

    remove_column :roasts, :thumbnail_image_url, :string
    add_foreign_key :device_problems, :devices
  end
end
