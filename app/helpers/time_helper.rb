require 'date'
module TimeHelper
	def this_year_months
		arr = []
		(1..Time.now.month).each do |month|
			arr.push(Date::MONTHNAMES[month])
		end
		return arr
	end
end
