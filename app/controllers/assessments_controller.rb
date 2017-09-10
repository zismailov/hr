class AssessmentsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose :user
  expose :assessment
  expose :assessments, -> { user.assessments }
  expose :invites, -> { fetch_invites }
  expose :feedbacks, -> { fetch_feedbacks }

  def show
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
    assessment.destroy

    redirect_to user_assessments_path(user)
  end

  private

  def assessment_params
    params.require(:assessment).permit(:user_id, :date)
  end

  def fetch_invites
    assessment.invites.includes(:user)
  end

  def fetch_feedbacks
    assessment.feedbacks.includes(:user, skill_feedbacks: :skill)
  end
end
