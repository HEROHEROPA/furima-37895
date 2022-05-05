require 'rails_helper'


RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    it 'メールアドレスが空では登録できない' do
      @user.email=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end  
   
    it '登録済みのメールアドレスでは登録できない' do
      @user.password = "000c000"
      @user.password_confirmation=@user.password
      @user.save
      another_user=FactoryBot.build(:user)
      another_user.email=@user.email
      another_user.password = '000d000'
      another_user.password_confirmation=another_user.password
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end 

    it 'メールアドレスに＠が含まれていないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end  

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end  

    it 'passwordが5文字以下では登録できない' do
      @user.password = '2222g'
      @user.password_confirmation=@user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end 
    
    it 'passwordが数字のみでは登録できない' do
      @user.password = '222222'
      @user.password_confirmation=@user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end  

    it 'passwordが英字のみでは登録できない' do
      @user.password = 'kaeidkt'
      @user.password_confirmation=@user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end  

    it 'passwordが確認用passwordと不一致では登録できない' do
      @user.password=Faker::Internet.password(min_length: 6)
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end  


  end



end



# メールアドレスが必須であること。
#  メールアドレスが一意性であること。
#  メールアドレスは、@を含む必要があること。
#  パスワードが必須であること。
#  パスワードは、6文字以上での入力が必須であること
#  パスワードは、半角英数字混合での入力が必須であること
#  パスワードとパスワード（確認）は、値の一致が必須であること。
