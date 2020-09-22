class BuyerShippingaddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\d{,11}/}
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Shippingaddress.create(buyer_id: buyer.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end
