class AddCategoryToExpenditures < ActiveRecord::Migration[5.0]
  def change
    add_column :expenditures, :income_category_ids, :string
  end
end
