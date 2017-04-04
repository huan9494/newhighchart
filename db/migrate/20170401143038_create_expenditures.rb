class CreateExpenditures < ActiveRecord::Migration[5.0]
  def change
    create_table :expenditures do |t|
      t.integer :amount
      t.references :User, foreign_key: true

      t.timestamps
    end
  end
end
