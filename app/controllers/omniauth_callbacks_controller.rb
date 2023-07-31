class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # At this point, user is not logged-in yet
  # Skip pundit mandatory authorization

  Devise.omniauth_providers.each do |provider_name|
    define_method(provider_name) { callback_for(provider_name) }
  end

  def failure
    logger.error "Auth failure."
    provider_name = request.env["omniauth.strategy"]&.class&.name&.demodulize
    flash[:danger] = provider_name ? "An error occurred while connecting your #{provider_name} account" : "An error occurred while connecting an account"
    if !user_signed_in?
      redirect_to user_session_path
    elsif !current_user.onboarded
      redirect_to onboarding_index_url(id: :accounts)
    else
      redirect_to edit_profile_url
    end
  end

  private

  def callback_for(provider)
    auth = request.env["omniauth.auth"]
    @identity = SocialProvider.find_with_omniauth(auth)
    @identity = SocialProvider.new_with_omniauth(auth) if @identity.nil?

    provider_name = SocialProvider::PROVIDER_NAME_MAPPINGS[provider] || provider
    if user_signed_in?
      if @identity.persisted?
        if @identity.user == current_user
          # User is trying to link his linked social account again
          @identity.update_from_omniauth(auth)

          sign_in_and_redirect current_user, event: :authentication
          set_flash_message(:notice, :success, kind: provider_name) if is_navigational_format?
        else
          # User is trying to link a social account that belongs to a different user
          redirect_to root_url, alert: t("devise.omniauth_callbacks.duplicate_failture", kind: provider_name)
        end
      else
        # User is trying to link a new social account
        @identity.user = current_user
        @identity.save
        current_user.join_gitlab_projects if @identity.provider == "gitlab"

        sign_in_and_redirect current_user, event: :authentication
        set_flash_message(:notice, :success, kind: provider_name) if is_navigational_format?
      end
    else
      if @identity.persisted?
        @identity.update_from_omniauth(auth)

        # Incoming social auth is associated with an existed account, just log user in
        @user = @identity.user
      else
        # New user logging in with social providers, create a new account and log user in
        logger.info "Finding or creating an account from tpa (email: #{auth['info']['email'].downcase}, provider: #{provider})"
        @user = User.find_or_create_with_omniauth(auth["info"])
        logger.info @user.as_json

        @user.skip_password_validation = true
        @identity.user = @user
        @identity.save
      end
      sign_in_and_redirect @user, event: :authentication
    end
  end
end
