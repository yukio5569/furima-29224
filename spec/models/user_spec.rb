require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、family_nameとfamily_name_kana、
          last_nameとlast_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数字混合であれば登録できる" do
        @user.password = "a00000"
        @user.password_confirmation = "a00000"
        expect(@user).to be_valid
      end
      it "emailに@が含まれていれば登録ができる" do
        @user.email = "email@com"
        expect(@user).to be_valid
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.family_name = "漢字ひらがなカタカナ"
        expect(@user).to be_valid
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.last_name = "漢字ひらがなカタカナ"
        expect(@user).to be_valid
      end
      it "family_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.family_name = "カタカナ"
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.last_name = "カタカナ"
        expect(@user).to be_valid
      end
    end
    

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailに@が含まれていないと登録が出来ない" do
        @user.email = "emailcom"
        @user.valid？
        expect(@user.errors.full_messages).to include("メールアドレスに「＠」を挿入してください。「#{@user.email}」内に＠がありません。")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが半角英数字混合でなれば登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)の姓を入力してください")
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        user.family_name_kana = "katakana"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)の姓は日本語で入力してください")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）の名を入力してください")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        user.last_name_kana = "katakana"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）の名は日本語で入力してください")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)の姓を入力してください
        ")
      end
      it "family_name_kanaが全角（カタカナ）でないと登録できない" do
        user.family_name_kana = "片仮名"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)の姓はカタカナで入力してください")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（全角）の名を入力してください")
      end
      it "last_name_kanaが全角（カタカナ）でないと登録できない" do
        user.last_name_kana = "片仮名"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（全角）の名はカタカナで入力してください")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday_id = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end