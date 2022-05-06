FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6,mix_case: true)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'陸三郎'}
    last_name_k           {'ヤマダ'}
    first_name_k          {'リクサブロウ'}
    birth_date            {'1931-01-02'}
  end
end

