require "rails_helper"

RSpec.describe "Homes", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "GET /index" do
    it "responds with 200" do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
