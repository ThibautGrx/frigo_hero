require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, create_list(:item, 2))
  end

  it "renders a list of items" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
