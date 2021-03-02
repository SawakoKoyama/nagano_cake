class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.find(params[:id])
    @details = @orders.order_details

  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
    redirect_to admin_orders_path(order.id)
    end
  end

end
