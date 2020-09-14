class ItemsController < ApplicationController

  before_action :user_signin, only: [:new]
  
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
   
  end

  def edit
  end

  def update
    
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :price, :category_id, :status_id, :delivery_fee_id, :prefectures_id, :days_id).merge(user_id: current_user.id)
  end

  def user_signin
    unless user_signed_in?
      redirect_to new_user_session_path 
    end
  end

  
end
