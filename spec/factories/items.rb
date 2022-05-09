FactoryBot.define do
  factory :item do
    # image                    {Faker::Lorem.sentence}  
    item_name                {Faker::Lorem.sentence}
    item_explaining          {Faker::Lorem.sentence}
    category_id              {Faker::Number.between(from: 2, to: 10)}
    item_state_id            {Faker::Number.between(from: 2, to: 10)}
    pay_for_shipping_id      {Faker::Number.between(from: 2, to: 10)}
    shipping_region_id       {Faker::Number.between(from: 2, to: 10)}
    shipping_day_id          {Faker::Number.between(from: 2, to: 10)}
    price                    {Faker::Number.between(from: 300, to: 999999)}
    user_id                  {Faker::Number.between(from: 2, to: 10)}
  end
end




