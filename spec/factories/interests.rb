FactoryBot.define do
  factory :interest do
    association :user
    association :item
  end
end
