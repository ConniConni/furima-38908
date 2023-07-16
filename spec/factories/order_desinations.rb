FactoryBot.define do
  factory :order_destination do
    post_code            { '123-4567' }
    prefecture_id        { Faker::Number.between(from: 2, to: 47) }
    municipality         { '横浜市' }
    address              { '青山1-1-1' }
    building             { 'TECH HOUSE' }
    telephone_number     { '00000000000' }
  end
end
