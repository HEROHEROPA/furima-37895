FactoryBot.define do
  factory :order do
    postal_code                { Faker::Lorem.sentence }
    city                       { Faker::Lorem.sentence }
    shipping_region_id         { Faker::Number.between(from: 2, to: 48) }
    house_number               { Faker::Lorem.sentence }
    house_name                 { Faker::Lorem.sentence }
    phone_number               { Faker::Number.number(digits: 11) }
    
    # association :shipping   orderはモデルでないためassociationは記述できない。
    # after(:build) do |item|
    #   item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'test_image.png')
    end
end


# バリデーションを組んでいるモデルに単体テストコードを記述する。

