class BooksController < ApplicationController

	before_action :correct_user, only: [:edit, :update]

	def create
		@book = Book.new(book_params)
		@book.user = current_user
		if @book.save
			flash[:book_created] = 'You have creatad book successfully.'
			redirect_to book_path(@book)
		else
			@books = Book.all
			@user = current_user
			render :index
		end
	end

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def show
		@new = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:book_updated] = 'You have updated book successfully.'
			redirect_to book_path(@book)
		else
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		if book.destroy
			flash[:book_destroyed] = 'You have destroyed book successfully.'
			redirect_to user_path(current_user)
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

	def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  	end

  	def correct_user
  		book = Book.find(params[:id])
  		user = book.user
  		if current_user != user
  			redirect_to books_path
  		end
  	end

end
