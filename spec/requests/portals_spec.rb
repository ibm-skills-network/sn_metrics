require "rails_helper"

RSpec.describe "Portals", type: :request do
  let(:portal) { create(:portal) }

  describe "GET /portals/:slug" do
    it "responds with 200" do
      get portal_path(portal)
      expect(response).to have_http_status(:ok)
    end
  end
end
