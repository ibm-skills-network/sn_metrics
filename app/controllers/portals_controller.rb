class PortalsController < ApplicationController
  include ActionView::Helpers::DateHelper
  layout "shell"

  before_action :set_portal, only: %w[show]

  def show
    @content_data = []
    if @portal.installed_catalog_items.present?
      @content_data.append({
                             "label" => "Installed Catalog Items",
                             "value" => @portal.installed_catalog_items
                           })
    end
    if @portal.installed_non_catalog_items.present?
      @content_data.append({
                             "label" => "Installed Non-Catalog Items",
                             "value" => @portal.installed_non_catalog_items
                           })
    end
    if @portal.outdated_catalog_items.present?
      @content_data.append({
                             "label" => "Outdated Items",
                             "value" => @portal.outdated_catalog_items
                           })
    end

    @login_data = []
    if @portal.last_login.present?
      @login_data.append({
                           "label" => "Last Login",
                           "value" => "#{time_ago_in_words(@portal.last_login)} ago"
                         })
    end
    if @portal.last_join.present? # rubocop:disable Style/GuardClause
      @login_data.append({
                           "label" => "Last Registration",
                           "value" => "#{time_ago_in_words(@portal.last_join)} ago"
                         })
    end
  end

  private

  def set_portal
    @portal = Portal.find_by(slug: params[:id])
  end
end
