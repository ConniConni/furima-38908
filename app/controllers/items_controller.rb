class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_sign_in, only: [:edit, :destroy]

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
      render :new
    end
  end

  def show
  end

  def edit
    if @item.order != nil
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :image, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_sign_in
    redirect_to root_path unless current_user == @item.user
  end
end
