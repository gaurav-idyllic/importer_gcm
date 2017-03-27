class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
      t.string :name_map

      t.timestamps null: false
    end
  end
end
