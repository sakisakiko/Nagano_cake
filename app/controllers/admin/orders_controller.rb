class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(patams[:id])
    @order_details=OrderDetail.find_by(order_id)
  end
  
  

  private
   
   def order_params
     params.require(:order).permit(:customer_id,:shipping_cost,:payment_price,
     :name,:postal_code,:address,:payment_method,:status)
   end

end





