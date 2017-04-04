class ExpenditureCategoryJoin < ApplicationRecord
  belongs_to :expenditure
  belongs_to :expenditure_category
end
