FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    municipalities { '横浜市緑区' }
    address { '青山1-1-1' }
    phone_number { '07022212301' }
    prefecture_id { 23 }
    building { 'マンション麻布' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
