# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    layout "onboarding_shell"
  end
end
