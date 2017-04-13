class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.integer :amount
      t.references :User

      t.timestamps
    end
    add_foreign_key :incomes, :users, column: :user_id
  end
end
