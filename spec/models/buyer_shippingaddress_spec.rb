require 'rails_helper'

RSpec.describe BuyerShippingaddress, type: :model do
  describe '商品購入機能' do
    before do
      @buyer_shippingaddress = FactoryBot.build(:buyer_shippingaddress)
    end

    context '商品購入がうまくいくとき' do
      it "number, exp_month, exp_year, cvc, postal_code, prefecture_id, city, address, phone_number, tokenが存在すれば登録できる" do
        expect(@buyer_shippingaddress).to be_valid
      end
      it "building_nameは空でも購入できる" do
        @buyer_shippingaddress.building_name = ""
        expect(@buyer_shippingaddress).to be_valid
      end
    

    context '商品購入がうまくいかないとき' do
      it "tokenが空だと購入できない" do
        @buyer_shippingaddress.token = ""
        @buyer_shippingaddress.valid?
        expect(@buyer_shippingaddress.errors.full_messages).to include("クレジットカード情報入力を入力してください")
      end
      it "numberが空だと購入できない" do
        @buyer_shippingaddress.number = ""
        @buyer_shippingaddress.valid?
        expect(@buyer_shippingaddress.errors.full_messages).to include("クレジットカード情報入力を入力してください")
      end
      it "exp_monthが空では登録できない" do
        @buyer_shippingaddress.exp_month = ""
        @buyer_shippingaddress.valid?
        expect(@buyer_shippingaddress.errors.full_messages).to include("クレジットカード情報入力を入力してください")
      end
      it "exp_yearが空では登録が出来ない" do
        @buyer_shippingaddress.exp_year = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("クレジットカード情報入力を入力してください")
      end
      it "postal_codeが空では登録が出来ない" do
        @buyer_shippingaddress.postal_code = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "postal_codeにハイフンが含まれていないと登録が出来ない" do
        @buyer_shippingaddress.postal_code = "1234567"
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it "prefecture_idが空では登録できない" do
        @buyer_shippingaddress.prefecture_id = "---"
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("都道府県を入力してください")
      end
      it "cityが空では登録が出来ない" do
        @buyer_shippingaddress.city = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("市区町村を入力してください")
      end
      it "addressが空では登録が出来ない" do
        @buyer_shippingaddress.address = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("番地を入力してください")
      end
      it "phone_numberが空では登録が出来ない" do
        @buyer_shippingaddress.phone_number = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("電話番号を入力してください")
      end
      it "phone_numberにハイフンが含まれている場合は登録が出来ない" do
        @buyer_shippingaddress.phone_number = "090-123-456"
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("ハイフンは含めないでください")
      end
      it "phone_numberが12桁以上だと登録が出来ない" do
        @buyer_shippingaddress.phone_number = "012345678912"
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("電話番号は12桁以上入力できません")
      end
    end
  end
end
