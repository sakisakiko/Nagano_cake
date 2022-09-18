class Admin::OrderDetailsController < ApplicationController

  def update
  @order=Order.find(params[:order_id])
  @order_detail=@order.order_details.find(params[:id])
  if @order_detail.update(order_detail_params)

   if params[:order_detail][:status]=="making"#製作ステータスを1つ「製作中」へ→注文ステータスが「製作中」に更新
       @order.update(status: 2)
       redirect_to admin_order_path(@order.id)
   elsif @order.order_details.count == @order.order_details.where(status: "completed").count #製作ステータスを全て「製作完了」へ→注文ステータスが「発送準備中」に更新
         @order.update(status: 3)
         redirect_to admin_order_path(@order.id)
   else
         redirect_to admin_order_path(@order.id)
   end
  end
  end


  private
  def order_detail_params
   params.require(:order_detail).permit(:status)
  end


end

