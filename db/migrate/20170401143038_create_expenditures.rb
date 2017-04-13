class CreateExpenditures < ActiveRecord::Migration[5.0]
  def change
    create_table :expenditures do |t|
      t.integer :amount
      t.references :User

      t.timestamps
    end
    add_foreign_key :expenditures, :users, column: :User_id
  end
end
