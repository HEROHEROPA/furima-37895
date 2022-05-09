FactoryBot.define do
  factory :item do

    item_name                {Faker::Lorem.sentence}
    item_explaining          {Faker::Lorem.sentence}
    category_id              {Faker::Number.between(from: 2, to: 10)}
    item_state_id            {Faker::Number.between(from: 2, to: 10)}
    pay_for_shipping_id      {Faker::Number.between(from: 2, to: 10)}
    shipping_region_id       {Faker::Number.between(from: 2, to: 10)}
    shipping_day_id          {Faker::Number.between(from: 2, to: 10)}
    price                    {Faker::Number.between(from: 300, to: 999999)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'test_image.png')
  end
  end
end


# FactoryBot.define do
#   factory :message do
#     content {Faker::Lorem.sentence}
#     association :user
#     association :room

#     after(:build) do |message|
#       message.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'test_image.png') #io: File.openで設定したパスのファイル（public/images/test_image.png）を、test_image.pngというファイル名で保存をしています。
#     end
#   end
# end

