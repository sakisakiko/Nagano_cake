class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order.shipping_cost=800
  end

  def update
    @order=Order.find(params[:id])

  if @order.update(order_params)
    if params[:order][:status]=="deposited"#注文ステータスを「入金確認」に更新→制作ステータスが全て「制作待ち」に
      @order.order_details.update_all(status: 1)
      redirect_to admin_order_path(@order.id)
    else
      redirect_to admin_order_path(@order.id)
    end
  end
  end



  private

   def order_params
     params.require(:order).permit(:customer_id,:shipping_cost,:payment_price,
     :name,:postal_code,:address,:payment_method,:status)
   end

end





