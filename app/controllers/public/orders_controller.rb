class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def index
    @orders = current_customer.orders
  end

  def confirm
    @order = Order.new(order_params)
    @order.status = 0
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800

    if params[:order][:select] == "1"
      # 1 ご自身の住所
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
      @order.postal_code = current_customer.postal_code

    elsif params[:order][:select] == "2"
      # 2 登録住所から選択
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.name = @address.name
      @order.postal_code = @address.postal_code

      #session[:order][:postal_code] = @address.postal_code
      #session[:order][:address] = @address.address
      #session[:order][:name] = @address.name
    end
      @cart_items = current_customer.cart_items
  end

  def complete
  end

  def show
    @orders = Order.find(params[:id])
    @details = @orders.order_details

    #@sum = @orders.total_payment + @orders.shipping_cost
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.save
    create_all_order_details(@order)
    redirect_to public_orders_complete_path
  end

  private

  def create_all_order_details(order)
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      #order_detail.making_status = 0
      #byebug
      order_detail.save
    end
    cart_items.destroy_all
  end

  def order_params
    params.require(:order).permit(:address_id, :name, :status, :total_payment, :address, :payment_method, :shipping_cost, :postal_code)
  end

end
