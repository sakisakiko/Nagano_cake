class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order.shipping_cost=800
  end

  def update
     @order=Order.find(params[:id])

  if @order.update(status: 1)
     @order.order_details.update_all(status: 1)
     redirect_to admin_order_path(@order.id)
  elsif@order.order_details.update(status: 2)
       @order.update(status: 2)
       redirect_to admin_order_path(@order.id)
  elsif@order.order_details.update_all(status: 3)
       @order.update(status: 4)
       redirect_to admin_or
  else
    @order.update(order_params)
   end
  end



  private

   def order_params
     params.require(:order).permit(:customer_id,:shipping_cost,:payment_price,
     :name,:postal_code,:address,:payment_method,:status)
   end

end





