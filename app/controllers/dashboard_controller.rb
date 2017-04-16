
class DashboardController < ApplicationController
	before_action :authenticate_user!
	include TimeHelper
	include IncomesHelper
  	include ExpendituresHelper

	def graph
		current_month = Time.now.month

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
	      f.title(text: "Your Finance This Year")
	      f.xAxis(categories: this_year_months)
	      f.series(name: "Income", data: months_incomes((1..current_month).to_a))
	      f.series(name: "Expense", data: months_expenditures((1..current_month).to_a), color: '#FF0000')
	      f.yAxis [{title: {text: "Amount in USD", margin: 70} }]

	      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
	      f.chart({defaultSeriesType: "column"})
	    end
	end

	def piechart
      	@incomes_chart = LazyHighCharts::HighChart.new('pie') do |f|
	        f.title(text: "Your Incomes in #{params[:month_select]}") ##{params[:month]}, #{params[:year]}
	        f.series(name: "Incomes", data: income_data_piechart(convert_namemonth_to_number))

	        f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
	        f.chart({defaultSeriesType: "pie"})
    	end

    	@expenses_chart = LazyHighCharts::HighChart.new('pie') do |f|
	        f.title(text: "Your Expenses in #{params[:month_select]}")##{params[:month]}, #{params[:year]}
	        f.series(name: "Expenses", data: expense_data_piechart(convert_namemonth_to_number))

	        f.legend(align: 'right', verticalAlign: 'top', y: 575, x: -50, layout: 'vertical')
	        f.chart({defaultSeriesType: "pie"})
    	end

	end

	def convert_namemonth_to_number
		case params[:month_select]
		when "January"
			 1
		when "February"
			 2
		when "March"
			 3
		when "April"
			 4
		when "May"
			 5
		when "June"
			 6
		when "July"
			 7
		when "August"
			 8
		when "September"
			 9
		when "Octobor"
			 10
		when "November"
			 11
		else "December"
			 12
		end
	end


end
