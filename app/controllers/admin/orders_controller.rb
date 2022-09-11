class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order.shipping_cost=800
  end
  
  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end
  
  

  private
   
   def order_params
     params.require(:order).permit(:customer_id,:shipping_cost,:payment_price,
     :name,:postal_code,:address,:payment_method,:status)
   end

end





