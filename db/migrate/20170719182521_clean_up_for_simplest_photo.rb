class CleanUpForSimplestPhoto < ActiveRecord::Migration[5.1]
  def change
    remove_column :devices, :image_url, :string
    remove_column :roast_brands, :image_url, :string
    remove_column :roasts, :toggle_image_url, :string
  end
end
