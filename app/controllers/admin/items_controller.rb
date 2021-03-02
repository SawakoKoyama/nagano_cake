class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @items = Item.find(params[:id])
    @genre = Genre.all
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(item_params)
    redirect_to admin_item_path(@items.id)
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :genre_id, :is_active, :price)
  end

end
