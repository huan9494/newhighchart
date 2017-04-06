class ExpenditureCategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @expenditure_categories = current_user.expenditure_categories.all
  end

  def new
    @expenditure_category = ExpenditureCategory.new
  end
  def edit
    @expenditure_category = current_user.expenditure_categories.find(params[:id])
  end

  def create
    @expenditure_category = ExpenditureCategory.new(expenditure_category_params)
    if @expenditure_category.save
      flash[:notice] = 'Add new expenditure_category successfully :))'
      redirect_to expenditure_categories_path
    else
      flash[:notice] = 'Something went wrong :(('
      render 'new'
    end
  end

  def update
    @expenditure_category = current_user.expenditure_categories.find(params[:id])
    if @expenditure_category.update(expenditure_category_params)
      redirect_to expenditure_categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @expenditure_category = current_user.expenditure_categories.find(params[:id])
    @expenditure_category.destroy
    respond_to do |format|
      format.html{ redirect_to expenditure_categories_path, notice: "Expenditure_Category was successufully destroyed"}
      format.json{ head :no_content}
    end
  end

  private
  def expenditure_category_params
    params.require(:expenditure_category).permit(:name, :User_id)
  end
end
