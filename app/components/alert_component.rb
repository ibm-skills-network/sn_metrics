# frozen_string_literal: true

class AlertComponent < BaseComponent
  include ViewComponent::SlotableV2
  include HeroiconHelper

  DEFAULT_VARIANT = :notice
  VARIANT_MAPPINGS = {
    DEFAULT_VARIANT => "purple",
    :info => "purple",
    :warning => "yellow",
    :alert => "red",
    :danger => "red",
    :success => "green"
  }.freeze
  VARIANT_OPTIONS = VARIANT_MAPPINGS.keys

  ICON_VARIANT_MAPPINGS = {
    DEFAULT_VARIANT => { name: :"information-circle", variant: :solid },
    :info => { name: :"information-circle", variant: :solid },
    :warning => { name: :exclamation, variant: :solid },
    :alert => { name: :"x-circle", variant: :solid },
    :danger => { name: :"x-circle", variant: :solid },
    :success => { name: :"check-circle", variant: :solid }
  }.freeze

  renders_one :action, "ActionComponent"

  def initialize(message: "", variant: DEFAULT_VARIANT)
    @message = message
    @color = VARIANT_MAPPINGS[fetch_or_fallback(VARIANT_OPTIONS, variant, DEFAULT_VARIANT)]
    @icon = ICON_VARIANT_MAPPINGS[fetch_or_fallback(VARIANT_OPTIONS, variant, DEFAULT_VARIANT)]
  end

  class ActionComponent < BaseComponent
    DEFAULT_TAG = :a
    TAG_OPTIONS = [DEFAULT_TAG, :a, :summary].freeze

    def initialize(variant: AlertComponent::DEFAULT_VARIANT, tag: DEFAULT_TAG, **system_arguments)
      @system_arguments = system_arguments
      @system_arguments[:tag] = tag || DEFAULT_TAG

      color = VARIANT_MAPPINGS[fetch_or_fallback(AlertComponent::VARIANT_OPTIONS, variant, AlertComponent::DEFAULT_VARIANT)]
      @system_arguments[:classes] = "bg-#{color}-50 px-2 py-1.5 rounded-md text-sm font-semibold text-#{color}-800 hover:bg-#{color}-100 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-#{color}-50 focus:ring-#{color}-600"
    end

    def call
      render(BaseComponent.new(**@system_arguments)) { content }
    end
  end
end
