require 'rails_helper'

RSpec.describe User, type: :model do
  it "is creatable" do
    user = create(:user)
    last_user = User.last
    expect(last_user.username).to eq(user.username)
    expect(last_user.email).to eq(user.email)
    expect(last_user.password).to be_blank
  end

  context 'validations on username' do
    subject { build(:user) }
    it { is_expected.to validate_presence_of(:username).with_message("Nom d'utilisateur non renseigné") }
    it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity }
  end

  it "follows items link" do
    user = create(:user, :with_items).reload
    expect(user.items.first.user).to eq(user)
  end

  it "follows interests link" do
    user = create(:user, :with_interests).reload
    expect(user.interests.first.user).to eq(user)
  end

  it "follows interested_items link" do
    user = create(:user, :with_interests).reload
    expect(user.interested_items.first.interested_users.first).to eq(user)
  end

  it "follows profile link" do
    user = create(:user).reload
    expect(user.profile.user).to eq(user)
  end
end
