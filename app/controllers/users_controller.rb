class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:user_updated] = 'You have updated user successfully.'
  		redirect_to user_path
  	else
  		render 'edit'
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

end