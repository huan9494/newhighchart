class CreateExpenditureCategoryJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :expenditure_category_joins do |t|
      t.references :expenditure#, foreign_key: true
      t.references :expenditure_category#, foreign_key: true

      t.timestamps
    end
  end
end
