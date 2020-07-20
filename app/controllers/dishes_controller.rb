class DishesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @dishes = @category.dishes
  end

  def show
    @dish = Dish.find(param[:id])
    @images = @dish.images
  end
end
