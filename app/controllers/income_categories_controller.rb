class IncomeCategoriesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @income_categories = current_user.income_categories.all
    @income_category = IncomeCategory.new
  end

  def new
    @income_category = IncomeCategory.new
  end
  def edit
    @income_category = current_user.income_categories.find(params[:id])
  end

  def create
    @income_category = IncomeCategory.new(income_category_params)
    @income_categories = current_user.income_categories.all
    if @income_category.save
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
