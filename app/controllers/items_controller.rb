class ItemsController < ApplicationController

  def index
  end

  def new
    if user_signed_in?
     @item =Item.new
    else
     render "devise/sessions/new"
    end 
  end

  def create
     if user_signed_in?
      @item=Item.new(item_params)
        if @item.valid?
      #  if (@item[:price]!=nil && @item[:price]>300 && @item[:price]<=9999999 ) && @item.save
        # 検知順序を変更すると正常に処理されない。。原因は不明
         redirect_to root_path
       else
           render "items/new"
       end 
     end 
   end  

  def item_params
    params.require(:item).permit(:image,:item_name,:item_explaining,:category_id, :price,:item_state_id,:pay_for_shipping_id,:shipping_region_id,:shipping_day_id).merge(user_id: current_user.id)
  end

end
  

