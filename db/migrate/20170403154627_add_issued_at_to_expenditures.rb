class AddIssuedAtToExpenditures < ActiveRecord::Migration[5.0]
  def change
    add_column :expenditures, :issued_at, :datetime
  end
end
