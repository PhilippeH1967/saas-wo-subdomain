FactoryBot.define do
  factory :entreprises do
    name "MyString"
    street "rue 24"
    town "Montreal"
    zipcode "H2S 2R9"
    country "CANADA"
    taxconfig "0"
    association :owner, factory: :user
  end
end
