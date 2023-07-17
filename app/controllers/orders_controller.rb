class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]
  def index
    @order_destination = OrderDestination.new
  end

  def create
     @order_destination = OrderDestination.new(destination_params)
     if @order_destination.valid? 
        pry_item
        @order_destination.save
        redirect_to root_path
     else
        render :index
     end
    end
  end

  private

  def destination_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id && (@item.order != nil or @item.order == nil)
      redirect_to root_path
  end

  def pry_item
 
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: destination_params[:token],    
        currency: 'jpy'               
      )
  end
  end
end
