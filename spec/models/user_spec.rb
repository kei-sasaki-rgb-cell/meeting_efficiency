require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録情報' do
    context 'ユーザーが新規登録できる場合' do
      it '必須項目に全て記入、選択していれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが新規登録できない場合' do
      it 'ニックネームが記入されてなければ保存できない' do
        @user.nickname = ''
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが記入されて無ければ保存できない' do
        @user.email = ''
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが重複していたら登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        #binding.pry
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含めないと登録できない' do
        @user.email = 'user.co.jp'
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは５文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

    end
  end

end
