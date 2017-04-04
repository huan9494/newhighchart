class CreateIncomeCategoryJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :income_category_joins do |t|
      t.references :income, foreign_key: true
      t.references :income_category, foreign_key: true

      t.timestamps
    end
  end
end
