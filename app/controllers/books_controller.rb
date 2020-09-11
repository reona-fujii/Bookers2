class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @books = Book.all
    @book = Book
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end



end
