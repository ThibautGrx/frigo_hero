FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { "azerty" }
    password_confirmation { "azerty" }
    confirmed_at { Time.zone.now }
    after(:create) do |user|
      create(:profile, user: user)
    end

    trait :with_items do
      after(:create) do |user|
        create_list(:item, 5, user: user)
      end
    end

    trait :with_interests do
      after(:create) do |user|
        create_list(:interest, 5, user: user)
      end
    end
  end
end
