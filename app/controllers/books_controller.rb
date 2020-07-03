class BooksController < ApplicationController
  before_action :logged_in?
  before_action :check_for_buyers, only: %i[index update]
  before_action :check_for_sellers, only: %i[new create]

  def index
    @bought_books = current_user.books.where(sold: true)
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

  def book_params
    params.require(:book).permit(:title, :description, :author, :price)
  end
end
