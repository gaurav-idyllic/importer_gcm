class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :attachment
      t.string :file_name
      t.string :original_file_name
      t.integer :total_records, default: 0
      t.integer :processed_records, default: 0
      t.integer :failed_records, default: 0
      t.integer :status, default: 0
      t.text :failure_msg, default: ''

      t.timestamps null: false
    end
  end
end
