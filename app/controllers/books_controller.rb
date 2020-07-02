class BooksController < ApplicationController
  before_action :logged_in?

  def index
    @books = Book.all
  end

  private

  def logged_in?
    redirect_to login_path if current_user.nil?
  end
end
