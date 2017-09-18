class UsersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :users, -> { User.sorted }

  def index; end

  def update
    user.update_attributes(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:role, :level)
  end
end
