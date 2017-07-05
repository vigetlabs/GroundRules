class DeviceProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :device_problems do |t|
      t.string :statement, null: false
      t.json :content, null: false
      t.integer :device_id, null: false
      t.timestamps
    end
    add_index :device_problems, :problem
  end
end
