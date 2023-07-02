FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000aaa'}
    password_confirmation {password}
    firstname{'山田'}
    lastname{'太郎'}
    firstname_kana{'ヤマダ'}
    lastname_kana{'タロウ'}
    birthday{'1930-01-01'}
    #transient do
      #person { Gimei.name }
        #nickname              {Faker::Name.initials(number: 2)}
        #email                 {Faker::Internet.free_email}
        #password              {Faker::Internet.password(min_length: 6)}
        #password_confirmation {password}
        #firstname             {Faker::Name.initials(number:2)}
        #lastname              {Faker::Name.initials(number:2)}
        #firstname_kana        {Faker::Name.initials(number:2)}
        #lastname_kana         {Faker::Name.initials(number:2)}
        #firstname             {Faker::Name.person.first.kanji}
        #lastname              {Faker::Name.person.last.kanji}
        #firstname_kana        {Faker::Name.person.first.katakana}
        #lastname_kana         {Faker::Name.person.last.katakana}
        #birthday              {Faker::Date.birthday}
    #end  
  end
end