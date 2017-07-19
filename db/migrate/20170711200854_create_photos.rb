class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :name,       null: false
      t.string :image_uid,  null: false
      t.string :image_name

      t.timestamps null: false
    end
  end
end
