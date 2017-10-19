module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    redirect_to :back, alert: "Извините, запрошенная функция недоступна."
  end
end
