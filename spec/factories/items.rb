Factory.define do
  factory :item do
    name { "商品名" }
    image
    explanation { "商品説明文" }
    category_id { 1 }
    status_id { 1 }
    delivery_fee_id { 1 }
    prefectures_id { 1 }
    days_id { 1 }
    price
  end
end