class ItemsController < ApplicationController

  before_action :user_signin, only: [:new]
  before_action :set_item, only: [:edit, :show, :update]
  
   def index
     @items = Item.order("created_at DESC")
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

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def edit
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :price, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
  end

  def user_signin
    unless user_signed_in?
      redirect_to new_user_session_path 
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
