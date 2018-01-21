class AssessmentsController < ApplicationController
  before_action :authorize!
  before_action :authenticate_user!

  respond_to :html

  expose :invite, -> { Invite.new }

  expose_decorated :user
  expose_decorated :assessment
  expose_decorated :assessments, -> { user.assessments.active.sorted_by_date }

  expose_decorated :users, -> { User.sorted }
  expose_decorated :invites, -> { fetch_invites }
  expose_decorated :feedbacks, -> { assessment.feedbacks.includes(:user) }

  def show
    @assessment_comments = AssessmentComments.new(assessment).results
    @assessment_statistics = AssessmentStatistics.new(assessment).results
  end

  def create
    assessment.user = user
    assessment.save

    redirect_to user_assessments_path(user)
  end

  def update
    assessment.update_attributes(assessment_params)

    redirect_to user_assessments_path(user)
  end

  def destroy
    assessment.deleted_at = Time.zone.now
    assessment.save

    redirect_to user_assessments_path(user)
  end

  private

  def assessment_params
    params.require(:assessment).permit(:user_id, :date, :role)
  end

  def authorize!
    authorize params[:action] == "index" ? user : assessment, "#{params[:action]}?"
  end

  def fetch_invites
    assessment.invites.includes(:user, :feedback)
  end
end
