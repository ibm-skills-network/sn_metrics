# frozen_string_literal: true

class PageHeadingComponent < ViewComponent::Base
  renders_one :extra
  renders_one :title_extra
  renders_one :title_alternative
  renders_one :description

  def initialize(title: nil)
    @title = title
  end
end
