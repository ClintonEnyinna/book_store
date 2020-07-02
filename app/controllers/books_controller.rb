class BooksController < ApplicationController
  before_action :logged_in?
  before_action :correct_user?, only: %i[new create]

  def index
    @books = Book.search(params[:search])

    if current_user.is_a?(Seller)
      @registered_books = Book.where(seller_id: current_user.id)
      @sold_books = @registered_books.where(sold: true)
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.registered_books.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def logged_in?
    redirect_to login_path if current_user.nil?
  end

  def correct_user?
    redirect_to root_path if current_user.is_a?(Buyer)
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :price)
  end
end
