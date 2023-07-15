class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_destination = OrderDestination.new(destination_params)
    if @order_destination.valid? 
      @order_destination.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def destination_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :municipality, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
