class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:image, :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :building).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    binding.pry
    Payjp.api_key = sk_test_5c1a39806b89be0f4df5a4f0
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
