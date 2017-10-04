class AssessmentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :unarchived!

  respond_to :html

  expose :user
  expose :assessment
  expose :assessments, -> { user.assessments.unarchived }

  expose_decorated :users, -> { User.sorted }
  expose_decorated :invites, -> { fetch_invites }
  expose_decorated :feedbacks, -> { fetch_feedbacks }

  def show
    redirect_to root_path unless policy(user).show?
    @assessment_statistics = AssessmentStatistics.new(assessment).results
  end

  def index
    redirect_to root_path unless policy(user).show?
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
    params.require(:assessment).permit(:user_id, :date)
  end

  def fetch_invites
    assessment.invites.includes(:user)
  end

  def fetch_feedbacks
    assessment.feedbacks.includes(:user, skill_feedbacks: :skill)
  end

  # def unarchived
  # end
end
