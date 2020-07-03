class OrdersController < ApplicationController
  before_action :check_for_buyers
  before_action :logged_in?

  def index
    @cart_books = current_user.books.where(sold: false)
  end

  def create
    @book = Book.find(params[:book_id])
    current_user.books << @book if @book
    redirect_to root_path
  end

  def destroy
    @book = Book.find(params[:book_id])
    unless @book.sold
      @order = Order.find_by(book_id: params[:book_id])
      @order&.destroy
    end
    redirect_to request.referer
  end

  private

  def logged_in?
    redirect_to login_path if current_user.nil?
  end
end
