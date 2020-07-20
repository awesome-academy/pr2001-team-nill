class CategoriesController < ActionController::Base
  
  def index
      @categories = Category.all
      @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
       @category = Category.find(params[:id])
  end
end
