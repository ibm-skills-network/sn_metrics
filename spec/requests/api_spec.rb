require "rails_helper"

RSpec.describe "Api", type: :request do
  let(:portal) { create(:portal) }
  let(:user) { create(:user) }
  let(:token) { create(:access_token, scopes: "update_portals") }

  describe "POST /portals" do
    context "without oauth token" do
      it "Can create Portal" do
        post api_v1_portals_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with oauth token" do
      it "Can create Portal" do
        start_count = Portal.count
        post api_v1_portals_path, params: { name: "Portal Name", slug: "portal-slug", access_token: token.token }
        expect(Portal.count).to eq(start_count + 1)
      end

      it "Can update Portal" do
        portal
        new_domain = "http://localhost"
        post api_v1_portals_path, params: { slug: portal.slug, domain: new_domain, access_token: token.token }
        expect(Portal.find_by(slug: portal.slug).domain).to eq(new_domain)
      end
    end
  end
end
