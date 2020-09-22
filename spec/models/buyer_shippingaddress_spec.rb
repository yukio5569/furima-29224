require 'rails_helper'

RSpec.describe BuyerShippingaddress, type: :model do
  describe '商品購入機能' do
    before do
      @buyer_shippingaddress = FactoryBot.build(:buyer_shippingaddress)
    end

    context '商品購入がうまくいくとき' do
      it "number, exp_month, exp_year, cvc, postal_code, prefecture_id, city, address, phone_numberが存在すれば登録できる" do
        expect(@buyer_shippingaddress).to be_valid
      end
      it "郵便番号にハイフンが含まれていれば購入できる" do
        @buyer_shippingaddress.postal_code = "123-4567"
        expect(@buyer_shippingaddress).to be_valid
      end
      it "電話番号が11桁以内であれば購入できる" do
        @buyer_shippingaddress.phone_number = "09012345678"
        expect(@buyer_shippingaddress).to be_valid
      end
      it "building_nameは空でも購入できる" do
        @buyer_shippingaddress.building_name = ""
        expect(@buyer_shippingaddress).to be_valid
      end
    

    context '商品購入がうまくいかないとき' do
      it "numberが空だと購入できない" do
        @buyer_shippingaddress.number = ""
        @buyer_shippingaddress.valid?
        expect(@buyer_shippingaddress.errors.full_messages).to include("Token can't be blank")
      end
      it "exp_monthが空では登録できない" do
        @buyer_shippingaddress.exp_month = ""
        @buyer_shippingaddress.valid?
        expect(@buyer_shippingaddress.errors.full_messages).to include("Token can't be blank")
      end
      it "exp_yearが空では登録が出来ない" do
        @buyer_shippingaddress.exp_year = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では登録が出来ない" do
        @buyer_shippingaddress.postal_code = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("Postal  code can't be blank")
      end
      it "postal_codeにハイフンが含まれていないと登録が出来ない" do
        @buyer_shippingaddress.postal_code = "1234567"
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("Postal code is invalid")
      end
      it "prefecture_idが空では登録できない" do
        @buyer_shippingaddress.prefecture_id = "---"
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では登録が出来ない" do
        @buyer_shippingaddress.city = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では登録が出来ない" do
        @buyer_shippingaddress.address = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では登録が出来ない" do
        @buyer_shippingaddress.phone_number = ""
        @buyer_shippingaddress.valid？
        expect(@buyer_shippingaddress.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
