module SessionsHelper
  def log_in(user)
    session[:email] = user.email
  end

  def current_user
    if session[:email]
      user_email = session[:email]
      @current_user ||= Buyer.find_by(email: user_email) ||
                        Seller.find_by(email: user_email)
    end
  end

  def log_out
    session.delete(:email)
    @current_user = nil
  end
end
