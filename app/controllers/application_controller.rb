class ApplicationController < ActionController::Base
  include SessionsHelper

  def check_for_buyers
    redirect_to root_path if current_user.is_a?(Seller)
  end

  def check_for_sellers
    redirect_to root_path if current_user.is_a?(Buyer)
  end
end
