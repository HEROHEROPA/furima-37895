class OrdersController < ApplicationController
 
  before_action :authenticate_user!, only: [:index]


  def index
    @item = Item.find(params[:item_id])
    if user_signed_in?  &&  current_user.id != @item.user_id
     @order = Order.new
    else
     redirect_to root_path  
    end
  end

  def create
    @order = Order.new(get_item)
   if @order.valid?
      @order.save
      redirect_to  root_path
   else 
    @item = Item.find(params[:item_id])
    render :index
   end
  end

 private 
 
 def get_item
   params.require(:order).permit(:postal_code,:shipping_region_id, :city,:house_number, :house_name,:phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
 end

 

end
