class CreateExpenditureCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :expenditure_categories do |t|
      t.string :name
      t.references :User

      t.timestamps
    end
  end
end
