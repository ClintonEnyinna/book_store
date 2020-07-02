class BuyersController < ApplicationController
  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def buyer_params
    params.require(:buyer).permit(:name, :email, :address, :password, :password_confirmation)
  end
end
