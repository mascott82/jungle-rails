# app/controllers/concerns/current_cart_concern.rb
module CurrentCartConcern
  extend ActiveSupport::Concern

  private

  def current_cart
    # Check if the Cart model is defined and loaded
    unless defined?(Cart) && Cart.is_a?(Class)
      raise "Cart model is not defined or not loaded."
    end

    @current_cart ||= Cart.find_by(id: session[:cart_id])

    if @current_cart.nil?
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end

    @current_cart
  end
end