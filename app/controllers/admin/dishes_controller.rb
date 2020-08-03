class Admin::DishesController < Admin::BaseController
    before_action :set_dish, except: [:index, :new , :create]
    before_action :set_category, except: [:show]
    # GET /admin/categories
    def index
        @dishes = @category.dishes.paginate(page: params[:page],per_page: 10)
    end
    # GET /admin/categories/1
    def show
    end
    # GET /admin/categories/new
    def new
    	@dish = Dish.new
    end
    # POST /admin/categories
    def create
    	@dish = @category.dishes.build(dish_params)
        if @dish.save
            flash[:success] = "Dish Category"
            redirect_to admin_category_dishes_path(@category)
        else 
            flash[:danger] = "Register failed"
            render 'new'
        end
    end
    #tao menu_dish dung nest attribute
    # GET /admin/categories/1/edit
    def edit
    end
    # PATCH/PUT /admin/categories/1
    def update
        if @dish.update(dish_params)
            flash[:success] = "Dish was successfully updated."
            redirect_to admin_category_dishes_path(@category)
        else
            flash[:danger] = "Dish was not successfully updated."
            render 'edit'
        end
    end
    # DELETE /admin/categories/1
    def destroy
    @dish.destroy
    flash[:success] = 'Dish deleted!'
    redirect_to admin_category_dishes_url(@category)
    end
    private
    def set_dish
        @dish = Dish.find(params[:id])
    end
    def dish_params
        params.require(:dish).permit(:name,:money)
    end
    def set_category
         @category = Category.find(params[:category_id])
    end
end