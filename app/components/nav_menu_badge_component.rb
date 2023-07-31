# Badge component for the navigation menu
class NavMenuBadgeComponent < ViewComponent::Base
  TYPE_NO_RENDER = 0
  TYPE_DOT = 1
  TYPE_NUMBER = 2

  # @param count [Boolean,Integer] Defines how the badge is rendered, when `true` will render a dot, `false` will not render, integers render the count (where count > max becomes "9+")
  # @param max [Integer] The maximum badge count
  def initialize(count: false, max: 9)
    @type = case count
            when false, 0
              TYPE_NO_RENDER
            when true
              TYPE_DOT
            else
              TYPE_NUMBER
            end

    @rendered_count = ((count > max) ? "#{max}+" : count) if @type == TYPE_NUMBER
  end
end
