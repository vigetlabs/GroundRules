class AddActsAsList < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :position, :integer, null: false
    Device.order(:updated_at).each.with_index(1) do |todo_item, index|
      todo_item.update_column :position, index
    end

    add_column :roasts, :position, :integer, null: false
    Roast.order(:updated_at).each.with_index(1) do |todo_item, index|
      todo_item.update_column :position, index
    end

    add_column :roast_brands, :position, :integer, null: false
    RoastBrand.order(:updated_at).each.with_index(1) do |todo_item, index|
      todo_item.update_column :position, index
    end
  end
end
