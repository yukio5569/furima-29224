require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "name,image,explanation,price,category_id,status_id,delivery_fee_id,prefectures_id,days_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "価格の範囲が、¥300~¥9,999,999の間であれば登録できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end
      it "販売価格は半角数字であれば登録ができる" do
        @item.price = "300"
        expect(@item).to be_valid
      end
    end
    

    context '商品出品がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "imageが空では登録できない" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "explanationが空では登録が出来ない" do
        @item.explanation = ""
        @item.valid？
        expect(@item.errors.full_messages).to include("Explanation Select")
      end
      it "category_idが空では登録が出来ない" do
        @item.explanation_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "status_idが空では登録できない" do
        @item.status_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "delivery_fee_idが空では登録できない" do
        @item.delivery_fee_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it "delivery_fee_idが空では登録できない" do
        @item.delivery_fee_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it "prefectures_idが空では登録できない" do
        @item.prefectures_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("Prefectures Select")
      end
      it "days_idが空では登録できない" do
        @item.days_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("Days Select")
      end
      it "価格の範囲が、¥300~¥9,999,999以外は登録できない" do
        @item.price = "10000000"
        @item.valid？
        expect(@item.errors.full_messages).to include("Price Out of setting range")
        it "価格の範囲が、¥300~¥9,999,999以外は登録できない" do
          @item.price = "299"
          @item.valid？
          expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "販売価格は半角数字でなければ登録ができない" do
        @item.price = "３００"
        @item.valid？
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
    end
  end
end