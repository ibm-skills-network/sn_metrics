require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Ibmid < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = "openid".freeze

      option :name, "ibmid"
      option :client_options,
             {
               site: "https://login.ibm.com",
               authorize_url:
                 "https://login.ibm.com/oidc/endpoint/default/authorize",
               token_url: "https://login.ibm.com/oidc/endpoint/default/token",
               user_info_url:
                 "https://login.ibm.com/oidc/endpoint/default/userinfo",
               response_type: "id_token"
             }

      # Use Proof Key for Code Exchange (PKCE)
      option :pkce, true

      option :scope, DEFAULT_SCOPE
      option :provider_ignores_state, true

      uid { raw_info["uniqueSecurityName"] }

      info do
        {
          name: "#{raw_info['given_name']} #{raw_info['family_name']}",
          first_name: raw_info["given_name"],
          last_name: raw_info["family_name"],
          email: raw_info["email"]
        }
      end

      extra { { "raw_info" => raw_info } }

      def client_options
        options.fetch(:client_options)
      end

      def raw_info
        @raw_info ||=
          access_token.get(client_options.fetch(:user_info_url)).parsed
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
