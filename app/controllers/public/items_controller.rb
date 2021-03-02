class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :price)
  end

end
