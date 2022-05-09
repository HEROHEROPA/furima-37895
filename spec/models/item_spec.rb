require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品新規登録' do
    it '全ての項目に適切な値が入力されると新規投稿ができる' do
     @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.valid?
    end

    it '商品画像が無いと投稿できない。' do
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が未入力だと投稿できない' do
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.item_name=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '商品説明欄が未入力だと投稿できない' do
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.item_explaining=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item explaining can't be blank", "User must exist")
    end

    it 'カテゴリーの情報が未入力だと投稿できない' do
       @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.category_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1", "User must exist")
    end

    it '商品の状態の情報が未入力だと投稿できない' do
       @item.image = fixture_file_upload('app/assets/images/item-sample.png')
       @item.item_state_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item state must be other than 1", "User must exist")
    end

    it '配送料の負担の情報が未入力だと投稿できない。' do
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.pay_for_shipping_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Pay for shipping must be other than 1", "User must exist")
    end

    it '発送元の地域の情報が未入力だと投稿できない' do
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.shipping_region_id=1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping region must be other than 1", "User must exist")
    end

    it '価格の情報が未入力だと投稿できない' do
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.price=""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    
    end

    it '価格が半角数値以外だと投稿できない' do
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.price="kaie"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number", "User must exist")
   
    end
  end
  #pending "add some examples to (or delete) #{__FILE__}"
end




# 必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること。
# 商品画像を1枚つけることが必須であること。
#  商品名が必須であること。
#  商品の説明が必須であること。
#  カテゴリーの情報が必須であること。
#  商品の状態の情報が必須であること。
#  配送料の負担の情報が必須であること。
#  発送元の地域の情報が必須であること。
#  価格の情報が必須であること。
#  価格は半角数値のみ保存可能であること。