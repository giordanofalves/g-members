FactoryBot.define do
  factory :heading do
    content      { Faker::Lorem.word }
    heading_type { rand(1..3) }
    association :website, strategy: :build
  end
end
