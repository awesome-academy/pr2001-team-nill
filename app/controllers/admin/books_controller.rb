class Admin::BooksController < Admin::BaseController
  before_action :set_book, except: [:index, :new , :create]
  before_action :set_user, except: [:show]
  before_action :list_tables, only: %i(new edit)
  before_action :list_dishes, only: %i(new edit)
  # GET /admin/categories
  def index
    @books = @user.books.paginate(page: params[:page],per_page: 10)
  end
  # GET /admin/categories/1
  def show
    @tables = @book.tables.paginate(page: params[:page],per_page: 10)
    @dishes = @book.dishes.paginate(page: params[:page],per_page: 10)
  end
  # GET /admin/categories/new
  def new
    @book = Book.new
  end
  # POST /admin/categories
	def create
		@book = @user.books.build(book_params)
		if @book.save
			flash[:success] = "Create Book"
			redirect_to admin_user_books_path
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
    if @book.update(book_params)
    	lash[:success] = "Book was successfully updated."
      redirect_to admin_user_books_path(@user)
      else
        flash[:danger] = "Book was not successfully updated."
        render 'edit'
    end
  end
  # DELETE /admin/categories/1
  def destroy
    @book.destroy
    flash[:success] = 'Book deleted!'
    redirect_to admin_user_books_url(@user)
  end
  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit :name, table_ids:[], dish_ids:[]
end
  def set_user
    @user = User.find(params[:user_id])
  end
  def list_tables
    @tables = Table.all.select(:id, :name).map{|table| [table.name, table.id]}
  end
	def list_dishes
    @dishes = Dish.all.select(:id, :name).map{|dish| [dish.name, dish.id]}
end
end