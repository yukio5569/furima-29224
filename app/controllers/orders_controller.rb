class OrdersController < ApplicationController
before_action :move_to_index 

  def index
    @item = Item.find(params[:item_id])
    @shippingaddress = BuyerShippingaddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @shippingaddress = BuyerShippingaddress.new(shippingaddress_params)
    if @shippingaddress.valid?
      pay_item
      @shippingaddress.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def shippingaddress_params
    params.require(:buyer_shippingaddress).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
     amount:@item.price,
     card: shippingaddress_params[:token],
     currency:'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id ||  @item.buyer != nil
      redirect_to root_path
    end
  end

end
