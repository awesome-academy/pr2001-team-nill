class Admin::MenusDishesController < Admin::BaseController
	 before_action :set_menu, only: [:show, :edit, :update, :destroy]
	def index 
		@menudishes = MenuDish.paginate(page: params[:page],per_page: 10)
	end
	def new
		@menudish = MenuDish.new
	end
	def create
       @menudish = MenuDish.new(menu_id,dish_id)
        if @category.save
            flash[:success] = "Create Category"
            redirect_to admin_menu_dishes_path
            else 
                flash[:danger] = "Register failed"
                render 'new'
        end
	end
	def show
	end
	def edit
	end
	def update

	end
	def destroy
	end
	private
	end
end