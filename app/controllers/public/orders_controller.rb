class Public::OrdersController < ApplicationController
  
  def new
    @order=Order.new
  end
  
  def confirm
    @order=Order.new(order_params)
    @order.save
    redeirect to comfirm_path
  end
  
  def create
    @order=Order.new(order_params)
    @order.save
    redeirect to orders_path
  end
  
  
  
  def index
  end

  def show
  end
end

 private
  def order_params
   params.require(:order).permit(:customer_id,:shipping_cost,:payment_price,:name,:postal_code,:address,:payment_method,:status)
  end


 


