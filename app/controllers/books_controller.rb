class BooksController < ApplicationController
  before_action :logged_in?

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
  end

  private

  def logged_in?
    redirect_to login_path if current_user.nil?
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :price, :seller_id)
  end
end
