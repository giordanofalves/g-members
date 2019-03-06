FactoryBot.define do
  factory :website do
    url { Faker::Internet.url }
    url_shortened { Faker::Internet.url }
  end

  trait :g1 do
    url { 'https://g1.globo.com/' }
  end
end
