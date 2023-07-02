require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context'新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、firstname、lastname、firstname_kana、lastname_kana、birthdayが存在できれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context'新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
    
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordに英字と数字が含まれないと登録できない' do
        @user.password = '123456' 
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers") 
      end

      it 'firstnameが空の場合は登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'firstnameが半角の場合は登録できない' do
        @user.firstname = 'yamada' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
    
      it 'lastnameが空の場合は登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'lastnameが半角の場合は登録できない' do
        @user.lastname = 'taro' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid")
      end


      it 'firstname_kanaが空の場合は登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end

      it 'firstname_kanaが半角の場合は登録できない' do
        @user.firstname_kana = 'Yamada' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid") 
      end

      it 'firstname_kanaがひらがなの場合は登録できない' do
        @user.firstname_kana = 'やまだ' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid") 
      end

      it 'firstname_kanaが漢字の場合は登録できない' do
        @user.firstname_kana = '山田' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid") 
      end

      it 'lastname_kanaが空の場合は登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end

      it 'lastname_kanaが半角の場合は登録できない' do
        @user.lastname_kana = 'taro' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid")
      end

      it 'lastname_kanaがひらがなの場合は登録できない' do
        @user.lastname_kana = 'たろう' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid")
      end

      it 'lastname_kanaが漢字の場合は登録できない' do
        @user.lastname_kana = '太郎' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid")
      end

      it '生年月日が空の場合は登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
