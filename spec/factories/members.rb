FactoryBot.define do
  factory :member do
    name { Faker::Company.name }
    association :website, strategy: :build
  end
end
