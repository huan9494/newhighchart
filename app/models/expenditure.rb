class Expenditure < ApplicationRecord
  belongs_to :User

  has_many :expenditure_category_joins
  has_many :expenditure_categories, :through => :expenditure_category_joins
end
