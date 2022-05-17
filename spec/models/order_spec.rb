require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
      @user = FactoryBot.create(:user) 
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order,user_id:@user.id,item_id:@item.id)
  sleep   2  #テストに負荷がかかりすぎると値の作成時にエラーが発生しテスト挙動が不安定になるため処理を待たせる。
  end

describe '商品購入機能' do
    context '正常系' do
      it '全ての項目に適切な値が入力されると商品購入ができる' do
          @order.valid?
      end

      it '建物名が未入力でも購入できる' do
        @order.house_name = ""
        @order.valid?
     end
    end

    context '異常系' do
      it '郵便番号が未入力だと購入できない' do
         @order.postal_code = ""
         @order.valid?
         expect(@order.errors.full_messages).to include( "Postal code can't be blank") 
      end

      it '郵便番号に不備があると購入できない' do
        @order.postal_code = 38-99876
        @order.valid?
        expect(@order.errors.full_messages).to include( "Postal code is invalid")
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
      
      it '電話番号が9桁以下だと購入できない' do
        @order.phone_number = Faker::Number.number(digits: 9)
        @order.valid?
        expect(@order.errors.full_messages).to include( "Phone number is too short (minimum is 10 characters)")
     end
     it '電話番号が12桁以上だと購入できない' do
      @order.phone_number = Faker::Number.number(digits: 12)
      @order.valid?
      expect(@order.errors.full_messages).to include( "Phone number is too long (maximum is 11 characters)")
      end

      it 'item_idが無いと購入できない' do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include( "Item can't be blank")
        end

      it 'user_idが無いと購入できない' do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include( "User can't be blank")
        end  

      it 'tokenが無いと購入できない' do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include( "Token can't be blank")
        end

    end
end
  


end