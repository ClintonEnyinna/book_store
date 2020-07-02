module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      user_id = session[:user_id]
      @current_user ||= Buyer.find(user_id) || Seller.find(user_id)
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
