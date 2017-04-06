require 'date'
module ExpendituresHelper
	def first_day_of_month(x)
		Date.civil(Time.now.year, x, 1)
	end
	def last_day_of_month(x)
		Date.civil(Time.now.year, x, -1)
	end

	def months_expenditures(arr)
		array = []
		arr.each do |ar|
			array.push(Expenditure.where(User_id: current_user.id).where("? < issued_at AND issued_at < ?",
		first_day_of_month(ar.to_i), last_day_of_month(ar.to_i)).sum(:amount))
		end
		return array
	end
end
