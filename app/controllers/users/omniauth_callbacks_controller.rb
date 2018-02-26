module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      result = Users::GoogleOauth.call(data: request.env["omniauth.auth"].info)

      if result.user
        sign_in_and_redirect result.user
      else
        redirect_to root_path, alert: result.message
      end
    end
  end
end
