class IncomeCategoriesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @income_categories = current_user.income_categories.all
  end

  def new
    @income_category = IncomeCategory.new
  end
  def edit
    @income_category = current_user.income_categories.find(params[:id])
  end

  def create
    @income_category = IncomeCategory.new(income_category_params)
    if @income_category.save
      flash[:notice] = 'Add new income_category successfully :))'
      redirect_to income_categories_path
    else
      flash[:notice] = 'Something went wrong :(('
      render 'new'
    end
  end

  def update
    @income_category = current_user.income_categories.find(params[:id])
    if @income_category.update(income_category_params)
      redirect_to income_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @income_category = current_user.income_categories.find(params[:id])
    @income_category.destroy
    respond_to do |format|
      format.html{redirect_to income_categories_path, notice: 'Income_Category was successful destroyed'}
      format.json{head :no_content}
    end
  end

  private
  def income_category_params
    params.require(:income_category).permit(:name, :User_id)
  end
end
