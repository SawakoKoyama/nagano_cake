class Public::OrdersController < ApplicationController
  def new
    @orders = Order.new
    @addresses = current_customer.addresses
    p @addresses
  end

  def index
    @orders = Order.all
  end

  def confirm
    @orders = Order.find(params[:id])
  end

  def complete
  end

  def show
  end

  def create
  end

  private
  def order_params
    params.require(:order).permit(:updated_at, :name, :status, :total_payment, :price, :address, :payment_method, :shipping_cost, :amount)
  end

end
