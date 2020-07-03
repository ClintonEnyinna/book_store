class SellersController < ApplicationController
  before_action :logged_in?, only: [:show]
  before_action :check_for_sellers, only: [:show]

  def show
    @seller = Seller.find(current_user.id)
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      log_in @seller
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def logged_in?
    redirect_to login_path if current_user.nil?
  end

  def seller_params
    params.require(:seller).permit(:name, :phone, :email, :password, :password_confirmation)
  end
end
