require 'rails_helper'

RSpec.describe Item, type: :model do
  it "is creatable" do
    item = create(:item)
    last_item = Item.last
    expect(last_item.description).to eq(item.description)
    expect(last_item.date.to_s).to eq(item.date.to_s)
    expect(last_item.address).to eq(item.address)
    expect(last_item.latitude).to eq(item.latitude)
    expect(last_item.longitude).to eq(item.longitude)
    expect(last_item.user_id).to eq(item.user_id)
    expect(last_item.category).to eq(item.category)
    expect(last_item.image).to be_an_instance_of(ActiveStorage::Attached::One)
  end

  it "follows user link" do
    item = create(:item).reload
    expect(item.user.items.first).to eq(item)
  end

  it "follows interest link" do
    item = create(:item, :with_interests).reload
    expect(item.interests.first.item).to eq(item)
  end

  it "follows interest_users link" do
    item = create(:item, :with_interests).reload
    expect(item.interested_users.first.interested_items.first).to eq(item)
  end

  it { is_expected.to validate_presence_of(:description).with_message('Vous devez ajouter une description !') }
  it { is_expected.to validate_presence_of(:address).with_message('Vous devez ajouter une adresse pour le lieu de retrait !') }
  it { is_expected.to validate_presence_of(:date).with_message('Vous devez ajouter une date !') }
end
