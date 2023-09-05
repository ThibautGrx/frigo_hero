require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    assign(:item, create(:item))
  end

  it "renders attributes in <p>" do
    render
  end
end
