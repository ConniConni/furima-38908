require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入ができる場合' do
      it "全ての情報が存在すれば購入できる" do
        expect(@order_destination).to be_valid
      end
      it "buildingが空でも購入できる" do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it "post_codeが空の場合は登録できない" do
        @order_destination.post_code = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeが 「3桁ハイフン4桁」ではない場合は登録できない" do
        @order_destination.post_code = "1234567"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "post_codeが全角の場合は登録できない" do
        @order_destination.post_code = "１２３-４５６７"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが未選択の場合は登録できない" do
        @order_destination.prefecture_id = "1"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "municipalityが空の場合は登録できない" do
        @order_destination.municipality = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空の場合は登録できない" do
        @order_destination.address = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it "telephone_numberが空の場合は登録できない" do
        @order_destination.telephone_number = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "telephone_numberが10桁未満の場合は登録できない" do
        @order_destination.telephone_number = '12345678'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberが全角の場合は登録できない" do
        @order_destination.telephone_number = '１２３４５６７８９'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number is invalid")
      end
      it "telephone_numberに半角以外の数字が入っている場合は登録できない" do
        @order_destination.telephone_number = '12345678９'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐付いていない場合は登録できないこと" do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end  
      it "itemが紐付いていない場合は登録できないこと" do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
