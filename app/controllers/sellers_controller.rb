class SellersController < ApplicationController
  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def seller_params
    params.require(:seller).permit(:name, :phone, :email, :password, :password_confirmation)
  end
end
