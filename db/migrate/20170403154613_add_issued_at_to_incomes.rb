class AddIssuedAtToIncomes < ActiveRecord::Migration[5.0]
  def change
    add_column :incomes, :issued_at, :datetime
  end
end
