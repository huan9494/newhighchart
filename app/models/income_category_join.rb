class IncomeCategoryJoin < ApplicationRecord
  belongs_to :income
  belongs_to :income_category
end
