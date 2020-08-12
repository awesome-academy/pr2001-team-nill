class DishesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @dishes = @category.dishes.all
    
  end

  def show
    @dish = Dish.find(params[:id])
    @comments = @dish.comments
    
    if logged_in?
      @comments = current_user.comments.build(dish_id: params[:id])
    end
  end

  private
  #
  def dish_params
    params.require(:dish).permit :name, :money, :category_id
  end
end