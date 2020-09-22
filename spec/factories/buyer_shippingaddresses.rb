FactoryBot.define do
  factory :buyer_shippingaddress do

    number { '1234567890123456' }
    exp_month { '31' }
    exp_year { '12' }
    cvc { '123' }
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    phone_number { '09012345678' }
  end
end
