require 'rails_helper'

RSpec.describe Interest, type: :model do
  it "is creatable" do
    interest = create(:interest)
    last_interest = Interest.last
    expect(last_interest.user).to eq(interest.user)
    expect(last_interest.item).to eq(interest.item)
  end

  it "follows user link" do
    interest = create(:interest).reload
    expect(interest.user.interests.last).to eq(interest)
  end

  it "follows item link" do
    interest = create(:interest).reload
    expect(interest.item.interests.last).to eq(interest)
  end
end
