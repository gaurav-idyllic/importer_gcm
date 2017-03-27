class CreateCompanyCategories < ActiveRecord::Migration
  def change
    create_table :company_categories do |t|
      t.integer :company_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
