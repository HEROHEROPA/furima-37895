class ItemsController < ApplicationController
  before_action :get_item, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      render 'devise/sessions/new'
    end
  end

  def create
    if user_signed_in?
      @item = Item.new(item_params)
      if @item.valid?
        @item.save
        #  if (@item[:price]!=nil && @item[:price]>300 && @item[:price]<=9999999 ) && @item.save
        # 検知順序を変更すると正常に処理されない。。原因は不明
        redirect_to root_path
      else
        render 'items/new'
      end
    end
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'items/edit'
    end
  end

  def destroy
    @item.destroy if @item.user.id == current_user.id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explaining, :category_id, :price, :item_state_id, :pay_for_shipping_id,
                                 :shipping_region_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.find(params[:id])
  end
end
