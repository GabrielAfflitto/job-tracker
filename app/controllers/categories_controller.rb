class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_path(@category.id)
    else
      flash[:error] = @category.errors.full_messages
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    # binding.pry
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
