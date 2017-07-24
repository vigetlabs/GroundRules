class RemoveRoastDescription < ActiveRecord::Migration[5.1]
  def change
    remove_column :roasts, :description, :text
  end
end
