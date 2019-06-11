require 'rails_helper'

RSpec.describe "pages/about", type: :view do

    it "should show a post title" do
      render
      expect(rendered).to include 'lolka'
  end
end
