FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"漢字カタカナひらがな"}
    last_name             {"漢字カタカナひらがな"}
    family_name_kana      {"カタカナ"}
    last_name_kana        {"カタカナ"}





    
  end
end