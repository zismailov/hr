module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    message = "Извините, запрошенная функция недоступна."
    redirect_back(fallback_location: (request.referer || root_path), alert: message)
  rescue ActionController::RedirectBackError
    redirect_back(fallback_location: root_path, alert: message)
  end
end
