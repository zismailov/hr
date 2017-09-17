class UsersController < ApplicationController
  before_action :authenticate_user!

  expose_decorated :users, -> { User.sorted }

  def index; end
end
