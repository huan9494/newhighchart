class Income < ApplicationRecord
  belongs_to :User

  has_many :income_category_joins
  has_many :income_categories, :through => :income_category_joins
end
