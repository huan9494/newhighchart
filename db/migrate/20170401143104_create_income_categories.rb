class CreateIncomeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :income_categories do |t|
      t.string :name
      t.references :User

      t.timestamps
    end
    add_foreign_key :income_categories, :users, column: :User_id
  end
end
