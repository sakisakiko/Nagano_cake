class Public::OrdersController < ApplicationController

  def new
    @order=Order.new
  end


  def confirm
    @order=Order.new(order_params)
    @orders=current_customer.orders
    @cart_items=current_customer.cart_items
    @total_price=0
   
  end

  def complete
  end

  def create
  end


  def index
  end

  def show
  end

 private
  def order_params
   params.require(:order).permit(:name,:postal_code,:address,:payment_method,:shipping_cost,:payment_price)
  end


end





