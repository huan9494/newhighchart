class IncomeCategory < ApplicationRecord
  belongs_to :user

  has_many :income_category_joins
  has_many :incomes, :through => :income_category_joins
end
