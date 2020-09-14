class UsersController < ApplicationController
   before_action :ensure_correct_user, {only: [:edit, :update]}
  
  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
       redirect_to books_path
    end
  end
   
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
