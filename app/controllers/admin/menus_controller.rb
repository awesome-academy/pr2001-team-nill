class Admin::MenusController < Admin::BaseController
 before_action :set_menu, only: [:show, :edit, :update, :destroy]
    # GET /admin/menus
    def index
        @menus = Menu.paginate(page: params[:page],per_page: 10)
    end
    # GET /admin/menus/1
    def show
    end
    # GET /admin/menus/new
    def new
        @menu = Menu.new
    end
    # POST /admin/menus
    def create
       @menu = Menu.new(menu_params)
        if @menu.save
            flash[:success] = "Create Menu"
            redirect_to admin_menus_path
            else 
                flash[:success] = "Register failed"
                render 'new'
        end
    end
    # GET /admin/menus/1/edit
    def edit
    end
    # PATCH/PUT /admin/menus/1
    def update
        if @menu.update(menu_params)
            flash[:success] = "Menu was successfully updated."
            redirect_to admin_menus_url
        else
            flash[:success] = "Menu was not successfully updated."
            render 'edit'
        end
    end
    # DELETE /admin/menus/1
    def destroy
        @menu.destroy
        flash[:success] = "Menu was successfully destroyed."
        redirect_to admin_menus_url
    end
    private
    def set_menu
        @menu = Menu.find(params[:id])
    end
    def menu_params
        params.require(:menu).permit(:name)
    end
end