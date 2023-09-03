FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.street_name }
    city { Faker::Address.city }
    postal_code { Faker::Address.zip_code }
    phone { Faker::PhoneNumber.cell_phone }
    association :user

    after :build do |profile|
      profile.picture.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'profile_picture.jpg')), filename: 'profile_picture.jpg', content_type: 'image/jpeg')

    end
  end
end
