require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
      @user = FactoryBot.create(:user) #createメソッドで作成したユーザーデータをデータベースに保存idも作成される
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order,user_id:@user.id,item_id:@item.id)
    sleep 1  #テストに負荷がかかりすぎると値の作成時にエラーが発生しテスト挙動が不安定になるため処理を待たせる。
  end

describe '商品購入機能' do
    context '正常系' do
      it '全ての項目に適切な値が入力されると商品購入ができる' do
          @order.valid?
      end
    end

    context '異常系' do
      it '郵便番号が未入力だと購入できない' do
         @order.postal_code = ""
         @order.valid?
         expect(@order.errors.full_messages).to include( "Postal code can't be blank")
        
      end

      it '発送地域が未入力だと購入できない' do
        @order.shipping_region_id = 1
         @order.valid?
         expect(@order.errors.full_messages).to include( "Shipping region must be other than 1")
      end

      it '市町村が未入力だと購入できない' do
         @order.city = ""
         @order.valid?
         expect(@order.errors.full_messages).to include( "City can't be blank")
      end

      it '番地が未入力だと購入できない' do
         @order.house_number = ""
         @order.valid?
         expect(@order.errors.full_messages).to include( "House number can't be blank")
      end

      it '電話番号が未入力だと購入できない' do
         @order.phone_number = ""
         @order.valid?
         expect(@order.errors.full_messages).to include( "Phone number can't be blank")
      end

      it '電話番号に半角数字以外が入っていると購入できない' do
        @order.phone_number = Faker::Lorem.sentence
        @order.valid?
        expect(@order.errors.full_messages).to include( "Phone number is invalid")
      end
      

    end
end
  


end