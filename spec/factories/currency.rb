FactoryBot.define do
  factory :currency do
    value { rand(30.00..60.99) }
    active false
    expiration_date nil

    trait :active do
      active true
    end

    trait :forced do
      active true
      expiration_date { 1.hour.from_now }
    end
  end

  factory :invalid_currency, class: 'Currency' do
    value 'not_a_number'
    active false
    expiration_date nil
  end
end
