class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = @item.includes(:user)
      render :new
    end
  end

  def show
   
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :image, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
