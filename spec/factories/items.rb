FactoryBot.define do
  factory :item do
    description { Faker::Food.dish }
    date { Time.zone.now }
    address { Faker::Address.full_address }
    association :user

    after :build do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'item_image.jpg')), filename: 'item_image.jpg', content_type: 'image/jpeg')
    end

    trait :with_interests do
      after(:create) do |item|
        create(:interest, item: item)
      end
    end
  end
end
