require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品できるとき' do
      it 'titleとexplanation,category_id,state_id,delivery_fee_id,prefecture_id,day_id,priceとimageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'state_idが空では登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end
      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee is not a number')
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'day_idが空では登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Day is not a number')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは全角では登録できない' do
        @item.price = '１２３４５６７８９０'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
    end
  end
end
