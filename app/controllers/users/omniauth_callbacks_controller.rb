class Users::OmniauthCallbacksController < ApplicationController
    def twitter
        callback_from :twitter
    end
    
    def failure
        redirect_to new_user_registration_url
    end
    
    private
    
    def callback_from(provider)
        provider = provider.to_s
        @user = User.find_or_create_from_auth(request.env['omniauth.auth'].except('extra'))
    
        if @user.persisted? # DBに保存済みかどうかを判定
          flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
          sign_in_and_redirect @user, event: :authentication
        else
          session["devise.#{provider}_data"] = request.env['omniauth.auth'].except('extra')
          redirect_to new_user_session_url
        end
    end

    # You should also create an action method in this controller like this:
# def twitter
# end
 # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected
# The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
