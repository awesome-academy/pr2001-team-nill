class Admin::TablesController < Admin::BaseController
  before_action :set_table, only: [:show, :edit, :update, :destroy]
  # GET /admin/tables
  def index
    @tables = Table.paginate(page: params[:page],per_page: 10)
  end
  # GET /admin/tables/1
  def show
  end
  # GET /admin/tables/new
  def new
    @table = Table.new
  end
  # POST /admin/tables
  def create
    @table = Table.new(table_params) 
    if @table.save
      flash[:success] = "Table Create"
      redirect_to admin_tables_path
      else 
        flash[:danger] = "Register failed"
        render 'new'
    end
  end
  # GET /admin/tables/1/edit
  def edit
  end
  # PATCH/PUT /admin/tables/1
  def update
    @table = Table.find(params[:id])
    if @table.update(table_params)
    # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to admin_tables_path
    else
      render :edit
    end
  end
	# DELETE /admin/tables/1
	def destroy
		@table.destroy
		flash[:success] = "Table was successfully destroyed."
		redirect_to admin_tables_url
	end
	private
	def set_table
		@table = Table.find(params[:id])
	end
	def table_params
		params.require(:table).permit(:name ,:status )
	end
end