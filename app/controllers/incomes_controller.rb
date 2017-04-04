
class IncomesController < ApplicationController

  def index
    @incomes = current_user.incomes.all
  end

  def new
    @income = Income.new
    # @income_categories = current_user.income_categories.all
  end
  def edit
    @income = current_user.incomes.find(params[:id])
  end

  def create
    @income = Income.new(income_params)

    if @income.save
      flash[:notice] = 'Add new income successfully :))'
      redirect_to incomes_path
    else
      flash[:notice] = 'Something went wrong :(('
      render 'new'
    end
  end

  def update
    params[:income][:income_category_ids] ||= []
    @income = current_user.incomes.find(params[:id])

    if @income.update(income_params)
      redirect_to incomes_path
    else
      render 'edit'
    end
  end

  def destroy
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
