class DishesController < ApplicationController
     def index
      @category= Category.find(params[:category_id])
       @dishes = @category.dishes
       @categories = Category.all
     end
    
     def show
        @dish = Dish.find(param[:id])
        @images = @image_dish
    end

end
