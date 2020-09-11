class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :image
    validates :explanation
    validates :price, inclusion: { in: 300..9_999_999 , message: "Price Out of setting range"}
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefectures_id
    validates :days_id
  end
  # format: { with: /[300-9999999]\d{3,7}/

  belongs_to :user
  has_one :buyer
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days


   
    
    # validates :image
    # validates :explanation
    # validates :price, format: { with: /[300-9,999,999\d]/, message: "Price Out of setting range"}
    # validates :category_id
    # validates :status_id
    # validates :delivery_fee_id
    # validates :prefectures_id
    # validates :days_id

  
end
