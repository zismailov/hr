class InvitesController < ApplicationController
  respond_to :html

  expose :invite
  expose :invites

  def index; end

  def create
    invite.save

    redirect_to :back
  end

  def destroy
    invite.destroy

    redirect_to :back
  end

  private

  def invite_params
    params.require(:invite).permit(:assessment_id, :user_id)
  end
end
