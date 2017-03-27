class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company
      t.string :invoice_num
      t.date :invoice_date
      t.date :operation_date
      t.decimal :amount
      t.string :reporter
      t.text :notes
      t.string :status
      t.integer :operation_id

      t.timestamps null: false
    end
  end
end
