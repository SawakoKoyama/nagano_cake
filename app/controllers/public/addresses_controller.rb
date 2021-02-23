class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end


  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path
  end

  def edit
    @addresses = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    redirect_to public_addresses_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end


end
