require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿機能' do
    context 'コメント投稿ができる場合' do
      it '必須項目に記入したら投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが投稿できない場合' do
      it 'コメントが空だと投稿できない' do
        @comment.text = ''
        @comment.valid?
        #binding.pry
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it '誹謗中傷のコメントがある場合投稿できない' do
        @comment.text = "バカ"
        @comment.valid?
        #binding.pry
        expect(@comment.errors.full_messages).to include("Text is reserved")
      end
    end
  end
end
