class SocialProvider < ApplicationRecord
  belongs_to :user
  validates :sub, presence: true

  attribute :profile_url, :string
  attribute :show_on_profile, :boolean, default: true

  PROVIDER_NAME_MAPPINGS = {
    google_oauth2: "Google",
    ibmid: "IBMid"
  }.freeze

  PROVIDER_ICON_MAPPINGS = {
    google_oauth2: "/google_logo.svg",
    ibmid: "/ibmid_icon.png"
  }.freeze

  def update_from_omniauth(auth)
    update(
      email: auth["info"]["email"].downcase,
      access_token: auth["credentials"]["token"]
    )
  end

  def self.find_with_omniauth(auth)
    find_by(provider: auth["provider"], sub: auth["uid"])
  end

  def self.new_with_omniauth(auth)
    new(
      provider: auth["provider"],
      sub: auth["uid"],
      email: auth["info"]["email"].downcase,
      access_token: auth["credentials"]["token"]
    )
  end
end
