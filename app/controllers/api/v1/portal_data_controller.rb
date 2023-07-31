module Api
  module V1
    class PortalDataController < Api::V1::ApiController
      before_action :doorkeeper_authorize!

      def handle_data
        portal = Portal.find_by(slug: portal_params[:slug])

        if portal.present?
          portal.update(portal_params)
        else
          Portal.create(portal_params)
        end

        render(
          json: { "message": "Portal Data Queued for update" },
          status: :ok
        )
      end

      def portal_params
        params
          .permit(
            :name,
            :slug,
            :domain,
            :total_learners,
            :total_enrollments,
            :total_completions,
            :total_certificates,
            :last_login,
            :last_join,
            :installed_catalog_items,
            :installed_non_catalog_items,
            :outdated_catalog_items,
            { managers: [] },
            { learners_data: %i[label value change equal up down] },
            { enrollments_data: %i[label value change equal up down] },
            { completions_data: %i[label value change equal up down] },
            { certificates_data: %i[label value change equal up down] }
          )
      end
    end
  end
end
