class BookstorePagesController < ApplicationController
  before_action :logged_in?

  def home
    @books = Book.search(params[:search])

    if current_user.is_a?(Seller)
      @registered_books = Book.where(seller_id: current_user.id)
      @sold_books = @registered_books.where(sold: true)
    end
  end

  def buy
    @books = current_user.books.where(sold: false)
    @balance = current_user.balance
    @app_earnings = AppEarning.instance

    @books&.each do |book|
      book.update(sold: true)
      @balance -= book.price
      if @balance < 0
        break
      else
        book.buyer.decrement!(:balance, book.price)
        book.seller.increment!(:earnings, book.price - 1)
        @app_earnings.increment!(:earnings, 1)
      end
    end
    redirect_to books_path
  end

  private

  def logged_in?
    redirect_to login_path if current_user.nil?
  end
end
