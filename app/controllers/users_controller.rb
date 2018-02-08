class UsersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :user
  expose_decorated :users, -> { fetch_users }

  def index; end

  def update
    authorize user

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
end
