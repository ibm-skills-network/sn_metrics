# frozen_string_literal: true

class NavMenuSubitemComponent < ViewComponent::Base
  include HeroiconHelper

  def initialize(title:, link:, icon:, active:, badge: false)
    @title = title
    @link = link
    @icon = icon
    @active = active
    @badge = badge
  end
end
