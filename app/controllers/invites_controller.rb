class InvitesController < ApplicationController
  before_action :authorize!, only: %w[create destroy]

  expose :invite
  expose_decorated :invites, -> { fetch_invites }

  def index; end

  def create
    Invites::Create.call(invite: invite)

    redirect_back fallback_location: root_path
  end

  def destroy
    invite.destroy

    redirect_back fallback_location: root_path
  end

  private

  def invite_params
    params.require(:invite).permit(:assessment_id, :user_id)
  end

  def authorize!
    authorize invite, "#{params[:action]}?"
  end

  def fetch_invites
    current_user.invites.includes(:feedback, assessment: :user)
  end
end
