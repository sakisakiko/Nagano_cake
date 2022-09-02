class Public::OrdersController < ApplicationController

  def new
    @order=Order.new
  end


  def confirm
    @order=Order.new(order_params)
    @orders=Order.all
    @order=Order.find(params[:order][:select_address])
    if @order== "1"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    elsif @order== "2"
     @address = Address.find(params[:order][:address_id])
    else @order== "3"
    end

  end







  def create
  end




  def index
  end

  def show
  end

 private
  def order_params
   params.require(:order).permit(:name,:postal_code,:address,:payment_method)
  end


end





