FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { password }
    firstname             { '山田' }
    lastname              { '太郎' }
    firstname_kana        { 'ヤマダ' }
    lastname_kana         { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
