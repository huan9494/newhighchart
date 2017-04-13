class ExpenditureCategory < ApplicationRecord
  belongs_to :user

  has_many :expenditure_category_joins
  has_many :expenditures, :through => :expenditure_category_joins
end
