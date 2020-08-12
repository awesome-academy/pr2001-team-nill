class Search::DishesController < ApplicationController
  def index
    @dishes = if params[:name].present?
                Dish.search_name(params[:name])
              else
                @dishes = Dish.none
              end
  end
end