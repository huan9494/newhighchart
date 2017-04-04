class AddCategoryToIncomes < ActiveRecord::Migration[5.0]
  def change
    add_column :incomes, :category, :string
  end
end
