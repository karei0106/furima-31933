FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 6) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password }
    password_confirmation { password }
    first_name            { person.first.kanji }
    last_name             { person.first.kanji }
    first_name_ruby       { person.first.katakana }
    last_name_ruby        { person.first.katakana }
    birthday              { Faker::Date.backward }
  end
end
