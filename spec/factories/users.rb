FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {}
    last_name             {}
    family_name_kana      {}
    last_name_kana        {}
    birthday              {}




    
  end
end