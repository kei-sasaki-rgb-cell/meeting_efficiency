require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '会議内容投稿機能' do
    context '会議内容が投稿ができる場合' do
      it '必須項目に全て記入、選択していれば投稿できる' do
        expect(@post).to be_valid
      end
    end

    context '会議内容の投稿ができない場合' do
      it '何に関しての会議を行なったか記入されてない場合投稿できない' do
        @post.title = ''
        @post.valid?
        #binding.pry
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it '会議に関しての感想を書いてない場合投稿できない' do
        @post.text =''
        @post.valid?
        #binding.pry
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end

      it '会議の内容を選択していなければ投稿できない' do
        @post.content_id = 1
        @post.valid?
        #binding.pry
        expect(@post.errors.full_messages).to include('Content must be other than 1')
      end

      it '会議にかかった時間を選択していなければ投稿できない' do
        @post.meeting_time_id = 1
        @post.valid?
        #binding.pry
        expect(@post.errors.full_messages).to include('Meeting time must be other than 1')
      end

      it '会議の進め方を選択していなければ投稿できない' do
        @post.progress_id = 1
        @post.valid?
        #binding.pry
        expect(@post.errors.full_messages).to include('Progress must be other than 1')
      end

      it '会議での情報量を選択していなければ投稿できない' do
        @post.information_id = 1
        @post.valid?
        #binding.pry
        expect(@post.errors.full_messages).to include('Information must be other than 1')
      end

      it '会議での参加人数を選択していなければ投稿できない' do
        @post.people_id = 1
        @post.valid?
        #binding.pry
        expect(@post.errors.full_messages).to include('People must be other than 1')
      end
    end
  end


end
