class SessionsController < ApplicationController
  def new; end

  def create
    @user = Buyer.find_by(email: params[:session][:email].downcase) ||
            Seller.find_by(email: params[:session][:email].downcase)

    if @user&.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    log_out unless current_user.nil?
    redirect_to '/'
  end
end
