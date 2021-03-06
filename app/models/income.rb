class Income < ApplicationRecord
  belongs_to :user

  has_many :income_category_joins
  has_many :income_categories, :through => :income_category_joins
end
