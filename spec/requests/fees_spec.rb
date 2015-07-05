require 'rails_helper'

RSpec.describe "Fees", type: :request do
  describe "GET /fees" do
    it "works! (now write some real specs)" do
      get fees_path
      expect(response).to have_http_status(200)
    end
  end
end
