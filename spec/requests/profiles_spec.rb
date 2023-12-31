require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/profiles", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Profile. As you add validations to Profile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:profile)  }

  let(:invalid_attributes) { attributes_for(:profile) }

  describe "GET /show" do
    it "renders a successful response" do
      profile = create(:profile)
      get profile_url(profile)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      profile = create(:profile)
      get edit_profile_url(profile)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested profile" do
        profile = create(:profile)
        patch profile_url(profile), params: { profile: new_attributes }
        profile.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the profile" do
        profile = create(:profile)
        patch profile_url(profile), params: { profile: new_attributes }
        profile.reload
        expect(response).to redirect_to(profile_url(profile))
      end
    end
  end
end
