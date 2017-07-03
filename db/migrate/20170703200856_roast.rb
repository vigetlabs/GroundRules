class Roast < ActiveRecord::Migration[5.1]
  def change
    create_table :roasts do |t|
      t.string :name, null: false
      t.string :toggle_image_url, null: false
      t.string :thumbnail_image_url, null: false
      t.text :toggle_text, null: false
      t.text :description, null: false
      t.timestamps
    end
    add_index :roasts, :name, unique: true
  end
end
