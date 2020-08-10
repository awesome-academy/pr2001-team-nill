class DishesController < ApplicationController
  def index
    @dishes = if params[:name].present?
               Dish.search_name(params[:name]).order_by_created_at(params[:sort_by_created_at].to_sym)
              else
               Dish.all
              end
  end
  
  def show
    @dish = Dish.find(param[:id])
    @images = @dish.images
  end
  private
  def dish_params
end
end
