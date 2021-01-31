FactoryBot.define do
  factory :item do
    title { '本' }
    explanation { 'マンガ' }
    category_id { 3 }
    state_id { 1 }
    delivery_fee_id { 1 }
    prefecture_id { 23 }
    day_id       { 2 }
    price        { 1200 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
