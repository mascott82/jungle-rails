class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def cart
    @cart ||= begin
    cart_json = cookies[:cart].present? ? cookies[:cart] : '{}'
    cart_hash = JSON.parse(cart_json).to_h
    cart_hash.is_a?(Hash) ? cart_hash : {}
  end
  end
  helper_method :cart

  def enhanced_cart
    cart_data = JSON.parse(cart.to_s) rescue {} # Ensure cart is treated as a string before parsing
    @enhanced_cart ||= Product.where(id: cart_data.keys).map do |product|
      { product: product, quantity: cart_data[product.id.to_s] }
    end
  end
  helper_method :enhanced_cart

  def cart_subtotal_cents
    enhanced_cart.map { |entry| entry[:product].price_cents * entry[:quantity] }.sum
  end
  helper_method :cart_subtotal_cents

  def update_cart(new_cart)
    # Ensure that new_cart is converted to JSON format before storing
    cookies[:cart] = {
      value: new_cart.to_h.to_json, # Convert the hash to JSON format
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
