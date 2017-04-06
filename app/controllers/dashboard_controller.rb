
class DashboardController < ApplicationController
	before_action :authenticate_user!
	include TimeHelper
	include IncomesHelper
  	include ExpendituresHelper

	def welcome
		current_month = Time.now.month

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
	      f.title(text: "Your Finance This Year")
	      f.xAxis(categories: this_year_months)
	      f.series(name: "Income", data: months_incomes((1..current_month).to_a))
	      f.series(name: "Expense", data: months_expenditures((1..current_month).to_a), color: '#FF0000')
	      f.yAxis [
	                  {title: {text: "Amount in USD", margin: 70} }
	              ]

	      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
	      f.chart({defaultSeriesType: "column"})
	    end
	end
end
