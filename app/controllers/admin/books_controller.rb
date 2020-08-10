class Admin::BooksController < Admin::BaseController
	before_action :set_book, only: [:show, :edit, :update, :destroy]
	before_action :list_tables, only: %i(new edit)
	# GET /admin/menus
	def index
		@books = Books.paginate(page: params[:page],per_page: 10)
	end
	# GET /admin/menus/1
	def show
		@tables = @book.tables.paginate(page: params[:page],per_page: 10)
	end
	# GET /admin/menus/new
	def new
		@book = Book.new
	end
	# POST /admin/menus
	def create
		@book = Book.new(book_params)
			if @book.save
				flash[:success] = "Create Book"
				redirect_to admin_books_path
				else 
				flash[:danger] = "Register failed"
				render 'new'
			end
	end
	# GET /admin/menus/1/edit
	def edit
	end
	# PATCH/PUT /admin/menus/1
	def update
		if @book.update(book_params)
			flash[:success] = "Book was successfully updated."
			redirect_to admin_books_url
			else
				flash[:danger] = "Book was not successfully updated."
				render 'edit'
			end
	end
	# DELETE /admin/menus/1
	def destroy
		@book.destroy
		flash[:success] = "Book was successfully destroyed."
		redirect_to admin_books_url
	end
	private
	def set_book
		@book = Book.find(params[:id])
	end
	def book_params
		params.require(:book).permit(:name)
		params.require(:book).permit :name, dish_ids:[], menu_dishes_attributes:[:id, :menu_id, :dish_id]
	end
	def menu_params
		params.require(:book).permit :name, :image, dish_ids:[], menu_dishes_attributes:
			[:id, :menu_id, :dish_id]
	end
	def list_tables
		@dishes = Dish.all.select(:id, :name).map{|dish| [dish.name, dish.id]}
	end
 end