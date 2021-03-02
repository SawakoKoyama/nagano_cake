class Admin::HomesController < ApplicationController
    def top
        #@order_details = OrderDetail.all
        #@order_detail = current_customer.orders
     @orders = Order.all
     #order_details = @orders.order_details

    end
end
