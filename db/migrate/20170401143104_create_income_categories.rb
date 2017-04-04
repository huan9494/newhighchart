class CreateIncomeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :income_categories do |t|
      t.string :name
      t.references :User, foreign_key: true

      t.timestamps
    end
  end
end
