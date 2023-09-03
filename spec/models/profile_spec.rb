require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "is creatable" do
    profile = create(:profile)
    last_profile = Profile.last
    expect(last_profile.first_name).to eq(profile.first_name)
    expect(last_profile.last_name).to eq(profile.last_name)
    expect(last_profile.address).to eq(profile.address)
    expect(last_profile.picture).to be_an_instance_of(ActiveStorage::Attached::One)
    expect(last_profile.city).to eq(profile.city)
    expect(last_profile.postal_code).to eq(profile.postal_code)
    expect(last_profile.phone).to eq(profile.phone)
  end

  it "follows user link" do
    profile = create(:profile).reload
    expect(profile.user.profile).to eq(profile)
  end
end
