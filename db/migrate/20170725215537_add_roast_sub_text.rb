class AddRoastSubText < ActiveRecord::Migration[5.1]
  def change
    remove_column :roasts, :toggle_text, :text
    add_column :roasts, :description, :text, null: false
    add_column :roasts, :sub_description, :text, null: false
  end
end
