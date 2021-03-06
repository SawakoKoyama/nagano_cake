class Public::CustomersController < ApplicationController
  def show
    unless params[:id] == "my_page"
      @customer = Customer.find(params[:id])
    else
      @customer = Customer.find(current_customer.id)
    end
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    if @customer.update(is_active: false)
    reset_session
    redirect_to public_root_path
    end
  end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
