class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_buyer
    @current_buyer ||= Buyer.find(session[:buyer_id]) if session[:buyer_id]
  end
  helper_method :current_buyer

  def current_seller
    @current_seller ||= Seller.find(session[:seller_id]) if session[:seller_id]
  end
  helper_method :current_seller
  
  def authorize
    redirect_to new_session_path unless current_buyer
  end
end
