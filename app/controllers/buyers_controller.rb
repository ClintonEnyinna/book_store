class BuyersController < ApplicationController
  before_action :logged_in?, only: [:show]
  before_action :check_for_buyers, only: [:show]

  def show
    @buyer = Buyer.find(current_user.id)
  end

  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      log_in @buyer
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def logged_in?
    redirect_to login_path if current_user.nil?
  end

  def buyer_params
    params.require(:buyer).permit(:name, :email, :address, :password, :password_confirmation)
  end
end
