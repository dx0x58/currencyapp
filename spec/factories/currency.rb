FactoryBot.define do
  factory :currency do
    value { rand(30.00..60.99) }
    active :false
    expiration_date Time.current

    trait :active do
      active :true
    end
  end
end
