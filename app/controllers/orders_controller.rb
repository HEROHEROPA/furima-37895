class OrdersController < ApplicationController
 
  before_action :authenticate_user!, only: [:index]


  def index
    @item = Item.find(params[:item_id])
    @shippings=Shipping.all
    @shipping = ""
    @shippings.each do |shipping|
     if  shipping.item_id == @item.id
        @shipping = shipping
       break
     end
    end

    if user_signed_in?  &&  current_user.id != @item.user_id && @shipping ==""
     @order = Order.new
    else
     redirect_to root_path  
    end
  end

  def create
    # binding.pry
    @order = Order.new(get_item)
    @item = Item.find(params[:item_id])
   if @order.valid?

    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price ,  # 商品の値段
      card: get_item[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )

      @order.save
      redirect_to  root_path
   else 
    # @item = Item.find(params[:item_id])
    render :index
   end
  end

 private 
 
 def get_item
   params.require(:order).permit(:postal_code,:shipping_region_id, :city,:house_number, :house_name,:phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
 end                                                                                  #カード情報をトークン化した情報はorderホームオブジェクト意外のハッシュに保存されるためmergeで値を取得する                  

 

end
