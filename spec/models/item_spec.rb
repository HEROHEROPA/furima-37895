require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品新規登録' do
    context '正常系' do
      it '全ての項目に適切な値が入力されると新規投稿ができる' do
        @item.valid?
      end
    end

    context '異常系' do
      it '商品画像が無いと投稿できない。' do
        @item.image = nil
        @item.valid?
        # expect(@item.errors.full_messages).to include("Image can't be blank")
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名が未入力だと投稿できない' do
        @item.item_name = ''
        @item.valid?
        # expect(@item.errors.full_messages).to include("Item name can't be blank")
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品説明欄が未入力だと投稿できない' do
        @item.item_explaining = ''
        @item.valid?
        # expect(@item.errors.full_messages).to include("Item explaining can't be blank")
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end

      it 'カテゴリーの情報が未入力だと投稿できない' do
        @item.category_id = 1
        @item.valid?
        # expect(@item.errors.full_messages).to include('Category must be other than 1')
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end

      it '商品の状態の情報が未入力だと投稿できない' do
        @item.item_state_id = 1
        @item.valid?
        # expect(@item.errors.full_messages).to include('Item state must be other than 1')
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end

      it '配送料の負担の情報が未入力だと投稿できない。' do
        @item.pay_for_shipping_id = 1
        @item.valid?
        # expect(@item.errors.full_messages).to include('Pay for shipping must be other than 1')
        expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end

      it '発送元の地域の情報が未入力だと投稿できない' do
        @item.shipping_region_id = 1
        @item.valid?
        # expect(@item.errors.full_messages).to include('Shipping region must be other than 1')
        expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
      end

      it '価格の情報が未入力だと投稿できない' do
        @item.price = ''
        @item.valid?
        # expect(@item.errors.full_messages).to include("Price can't be blank")
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格が無効です。半角数字での入力をお願いします。", "価格は数値で入力してください")
      end

      it '価格が半角数値以外だと投稿できない' do
        @item.price = 'kaie'
        @item.valid?
        # expect(@item.errors.full_messages).to include('Price is not a number')
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it '価格が300円未満だと投稿できない' do
        @item.price = 250
        @item.valid?
        # expect(@item.errors.full_messages).to include('Price must be greater than 299')
        expect(@item.errors.full_messages).to include('価格は299より大きい値にしてください')
      end

      it '価格が1000万円以上だと投稿できない' do
        @item.price = 10_000_000
        @item.valid?
        # expect(@item.errors.full_messages).to include('Price must be less than 9999999')
        expect(@item.errors.full_messages).to include('価格は10000000より小さい値にしてください')
      end

      it 'ユーザーが紐づいていないと投稿できない' do
        @item.user = nil # ①アソシエーションを組んでおり自動で付与されるpresenseを適用したい場合はカラムを指定するのではなく左記の様に記述する。直接外部キーカラムを指定すると下記の理由により期待する結果を得られない。そのためアソシエーションそのものをnillにする必要がある。
        @item.valid? # ①である理由 → アソシエーションを組んでいるモデルの場合は値が生成され時点では外部キーカラムに値が入っていなくても（＊データを紐づける予定があると言う事を前提に）trueを返す仕様になっているため。
        # expect(@item.errors.full_messages).to include('User must exist')
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
