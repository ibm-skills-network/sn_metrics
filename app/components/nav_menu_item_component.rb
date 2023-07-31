# frozen_string_literal: true

class NavMenuItemComponent < ViewComponent::Base
  include HeroiconHelper

  renders_many :children, NavMenuSubitemComponent

  def initialize(title:, link:, icon:, active:, badge: false)
    @title = title
    @link = link
    @icon = icon
    @active = active
    @badge = badge
  end
end
