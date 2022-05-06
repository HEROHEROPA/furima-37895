require 'rails_helper'


RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    it '全ての項目に適切な値が入力されると新規登録ができる' do
      @user.valid?
    end
    it 'メールアドレスが空では登録できない' do
      @user.email=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end  
   
    it '登録済みのメールアドレスでは登録できない' do
      # @user.password = "000c000"
      @user.password_confirmation=@user.password
      @user.save
      another_user=FactoryBot.build(:user)
      another_user.email=@user.email
      # another_user.password = '000d000'
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

    it 'passwordに全角文字が入っていると登録できない' do    
      @user.password = 'kaeid T G9'
      @user.password_confirmation=@user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが確認用passwordと不一致では登録できない' do
      @user.password=Faker::Internet.password(min_length: 6, mix_case: true)
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end  

    it '苗字が未記入では登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end  

    it '名前が未記入数字では登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end  

    it '苗字に半角文字が入っていると登録出来ない' do
      @user.last_name = "k花田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end  

    it '名前に半角文字が入っていると登録できない' do
      @user.first_name = "k一郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end  

    it '苗字(カナ)が未記入では登録できない' do
      @user.last_name_k = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k can't be blank")
    end 
    
    it '名前(カナ)が未記入では登録できない' do
      @user.first_name_k = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank")
    end 
    
    it '苗字(カナ)に半角文字が入っていると登録できない' do
      @user.last_name_k="kハナダ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k is invalid. Input full-width katakana characters.")
    end 

    it '名前(カナ)に半角文字が入っていると登録できない' do
      @user.first_name_k="kイチロウ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k is invalid. Input full-width katakana characters.")
    end 
   
    it '生年月日が未記入だと登録できない' do
      @user.birth_date=""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end 

  end



end



