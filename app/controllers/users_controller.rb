class UsersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :users, -> { User.sorted }

  def index; end

  def update
    user.update_attributes(user_params)
    respond_with user
  end

  private

  def user_params
    params.require(:user).permit(:role, :level)
  end
end
