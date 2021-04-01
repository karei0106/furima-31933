require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '購入機能' do
    context '購入できるとき' do
      it 'postal_codeとmunicipalities,address,phone_number,prefecture_id,buildingが存在すれば登録できる' do
        expect(@order).to be_valid
      end
      it 'buildingが抜けていても登録できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    context '購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'municipalitiesが空では登録できない' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'user_idが空では登録できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'prefecture_idのidが0では登録できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'postal_codeは-が含まれていないと登録ができない' do
        @order.postal_code = '123.4567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'phone_numberが数字以外では登録できない' do
        @order.phone_number = 'あAa@'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
