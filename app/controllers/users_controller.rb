class UsersController < ApplicationController
  before_action :authorize!, only: %w[update]

  expose_decorated :user
  expose_decorated :users, -> { fetch_users }

  def index; end

  def update
    user.update(user_params)
    respond_with user
  end

  private

  def user_params
    params.require(:user).permit(:role, :level, :department_id)
  end

  def fetch_users
    User.sorted.includes(:assessments, :department)
  end

  def authorize!
    authorize user
  end
end
