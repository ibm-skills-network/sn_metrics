require "rails_helper"

RSpec.describe "Api", type: :request do
  let(:portal) { create(:portal) }
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "POST /portals" do
    it "Can create Portal" do
      start_count = Portal.count
      post api_v1_portals_path, params: { name: "Portal Name", slug: "portal-slug" }
      expect(Portal.count).to eq(start_count + 1)
    end

    it "Can update Portal" do
      portal
      new_domain = "http://localhost"
      post api_v1_portals_path, params: { slug: portal.slug, domain: new_domain }
      expect(Portal.find_by(slug: portal.slug).domain).to eq(new_domain)
    end
  end
end
