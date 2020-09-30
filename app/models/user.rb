class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buyers
      
  with_options presence: true do

    validates :nickname
    validates :email
    validates :email, uniqueness: true
    validates :password, uniqueness: true
    validates :password, format: { with: /[a-z\d]{6,}/i}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は日本語で入力してください"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は日本語で入力してください"}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください"}
    validates :birthday

  end
end
