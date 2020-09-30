require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
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
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "imageが空では登録できない" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "explanationが空では登録が出来ない" do
        @item.explanation = ""
        @item.valid？
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "category_idが空では登録が出来ない" do
        @item.explanation_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it "status_idが空では登録できない" do
        @item.status_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it "delivery_fee_idが空では登録できない" do
        @item.delivery_fee_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it "prefectures_idが空では登録できない" do
        @item.prefectures_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it "days_idが空では登録できない" do
        @item.days_id = "---"
        @item.valid？
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it "価格の範囲が、¥300~¥9,999,999以外は登録できない" do
        @item.price = "10000000"
        @item.valid？
        expect(@item.errors.full_messages).to include("販売価格を設定範囲内の半角数字で入力してください")
      end
        it "価格の範囲が、¥300~¥9,999,999以外は登録できない" do
          @item.price = "299"
          @item.valid？
          expect(@item.errors.full_messages).to include("販売価格を設定範囲内の半角数字で入力してください")
      end
      it "販売価格は半角数字でなければ登録ができない" do
        @item.price = "３００"
        @item.valid？
        expect(@item.errors.full_messages).to include("販売価格を設定範囲内の半角数字で入力してください")
      end
    end
  end
end