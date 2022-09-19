class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    @item_amount=Item.count
    @genres=Genre.all
  end

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
    @genres=Genre.all
  end


  private

  def item_params
    params.require(:item).permit(:image,:genre_id,:name,:introduction,:price,:is_active)
  end

end
