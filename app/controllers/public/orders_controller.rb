class Public::OrdersController < ApplicationController

  def new
    @order=Order.new
  end


  def confirm
    @order=Order.new(order_params)
    @orders=current_customer.orders
    @cart_items=current_customer.cart_items
    @order.shipping_cost= 800
    @order.payment_price=0

    if params[:order][:select_address] == "1"   # 自身の住所のとき
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "2" # 登録済み住所のとき
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else  params[:order][:select_address] == "3" # 新しい住所のとき
    end
  end


  def create
    @order=Order.new(order_params)
    @order.customer=current_customer
    @order.save

    @order_deital=Order_deital.new
    @cart_items=current_customer.cart_items
    @cart_items.destroy_all
    redirect_to complete_path
  end


  def complete
  end


  def index
  end

  def show
  end

 private
  def order_params
   params.require(:order).permit(:name,:postal_code,:address,:payment_method,:payment_price)
  end


end





