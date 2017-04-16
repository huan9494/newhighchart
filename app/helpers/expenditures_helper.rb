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
			array.push(Expenditure.where(user_id: current_user.id).where("? < issued_at AND issued_at < ?",
		first_day_of_month(ar.to_i), last_day_of_month(ar.to_i)).sum(:amount))
		end
		return array
	end

	def expense_data_piechart(month)
		
		month_expense_list = Expenditure.where(user_id: current_user.id).where("? <= issued_at AND issued_at <= ?",
		first_day_of_month(month.to_i), last_day_of_month(month.to_i))

		array = []
		(1..last_day_of_month(month).strftime("%d").to_i).each do |day|

			total_day_expense = 0
			month_expense_list.each do |month_expense_list|
				if (month_expense_list.issued_at.strftime("%d").to_i == day)
					total_day_expense += month_expense_list.amount.to_i
				end
			end

			if total_day_expense != 0
				array.push({name: "day" + day.to_s, y: total_day_expense})
			end
		end
		return array
	end

end

	