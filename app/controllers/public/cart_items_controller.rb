class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items=CartItem.all
  end
  
  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    
    if cuurent_customer.cart_item.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item.update(cart_item_params)
      redirect_to cart_item_path(@cart_item.id)
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end


  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
  
end
