
class IncomesController < ApplicationController

  before_action :authenticate_user!

  include TimeHelper
  include IncomesHelper
  include ExpendituresHelper

  def index
    @incomes = current_user.incomes.all
    @income = Income.new
  end

  def new
    @income = Income.new
    # @income_categories = current_user.income_categories.all
  end
  def edit
    @incomes = current_user.incomes.all
    @income = current_user.incomes.find(params[:id])
  end

  def create
    @incomes = current_user.incomes.all
    @income = Income.new(income_params)

    if @income.save

      @current_month = Time.now.month
      (0..@current_month - 1).each do |t|
        if months_incomes((1..@current_month).to_a)[t] < months_expenditures((1..@current_month).to_a)[t]
          @income_reference = 1
        else
          @income_reference = 0
        end
      end


      respond_to do |format|
          # format.html{ redirect_to expenditures_path, notice: "Add new expense successfully"}
          format.js #{ render :js => "window.location = '/expenditures' " }
        end
    else
      flash[:notice] = 'Something went wrong :(('
      render 'new'
    end
  end

  def update
    @incomes = current_user.incomes.all
    params[:income][:income_category_ids] ||= []
    @income = current_user.incomes.find(params[:id])

    if @income.update(income_params)
      redirect_to incomes_path
    else
      render 'edit'
    end
  end

  def destroy
    @incomes = current_user.incomes.all
    @income = current_user.incomes.find(params[:id])
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_path, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def income_params
    params.require(:income).permit(:amount, :User_id, :issued_at, income_category_ids: [])
  end
end
