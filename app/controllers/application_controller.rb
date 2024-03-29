class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end


def current_user
	if session[:user_id]
		User.find(session[:user_id])
	else
		nil
	end
end




def current_cart
	Cart.find(session[:cart_id])
rescue ActiveRecord::RecordNotFound
	cart = Cart.create
	session[:cart_id] = cart.id
	cart
end




	

