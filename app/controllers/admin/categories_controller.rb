class Admin::CategoriesController < Admin::BaseController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    # GET /admin/categories
    def index
        @categories = Category.paginate(page: params[:page],per_page: 10)
    end
    # GET /admin/categories/1
    def show
    end
    # GET /admin/categories/new
    def new
        @category = Category.new
    end
    # POST /admin/categories
    def create
       @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Create Category"
            redirect_to admin_categories_path
            else 
                flash[:danger] = "Register failed"
                render 'new'
        end
    end
    # GET /admin/categories/1/edit
    def edit
    end
    # PATCH/PUT /admin/categories/1
    def update
        if @category.update(category_params)
            flash[:success] = "Category was successfully updated."
            redirect_to admin_categories_url
        else
            flash[:danger] = "Category was not successfully updated."
            render 'edit'
        end
    end
    # DELETE /admin/categories/1
    def destroy
        @category.destroy
        flash[:success] = "Category was successfully destroyed."
        redirect_to admin_categories_url
    end
    private
    def set_category
        @category = Category.find(params[:id])
    end
    def category_params
        params.require(:category).permit(:name)
    end
end