class AssessmentsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose :user
  expose :assessment
  expose :assessments, -> { user.assessments }

  def create
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
end
