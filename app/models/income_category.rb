class IncomeCategory < ApplicationRecord
  belongs_to :User

  has_many :income_category_joins
  has_many :incomes, :through => :income_category_joins
end
