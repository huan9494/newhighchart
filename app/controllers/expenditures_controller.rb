
class ExpendituresController < ApplicationController
  before_action :authenticate_user!
  include TimeHelper
  include IncomesHelper
  include ExpendituresHelper

def index
    @expenditures = current_user.expenditures.all
  end

  def new
    @expenditure = Expenditure.new
  end
  def edit
    @expenditure = current_user.expenditures.find(params[:id])
  end

  def create
    @expenditure = Expenditure.new(expenditure_params)
    
    # current_month = Time.now.month
    # (0..months_incomes((1..current_month).to_a).length - 1).each do |i|
    #   if months_incomes((1..current_month).to_a)[i] < months_expenditures((1..current_month).to_a)[i]
    #     respond_to do |format|
    #       format.html{ redirect_to expenditures_path, notice: "Add new expense successfully :))"}
    #       format.json{ head :no_content}
    #       format.js
    #     end
    #   end
    # end


    if @expenditure.save
      flash[:notice] = 'Add new expense successfully :))'
      redirect_to expenditures_path
    else
      flash[:notice] = 'Something went wrong :(('
      render 'new'
    end
  end

  def update
    params[:expenditure][:expenditure_category_ids] ||= []
    @expenditure = current_user.expenditures.find(params[:id])

    if @expenditure.update(expenditure_params)
      redirect_to expenditures_path
    else
      render 'edit'
    end
  end

  def destroy
    @expenditure = current_user.expenditures.find(params[:id])
    @expenditure.destroy
    respond_to do |format|
      format.html{ redirect_to expenditures_path, notice: "Expense was successfully destroyed"}
      format.json{ head :no_content}
    end
  end

  private
  def expenditure_params
    params.require(:expenditure).permit(:amount, :User_id, :issued_at, expenditure_category_ids: [])
  end
end
