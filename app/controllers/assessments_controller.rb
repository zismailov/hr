class AssessmentsController < ApplicationController
  before_action :authorize!

  expose :invite, -> { Invite.new }
  expose :skills, -> { fetch_skills }
  expose :feedbacks, -> { assessment.feedbacks }

  expose_decorated :assessment
  expose_decorated :assessments, -> { user.assessments.active.sorted_by_date }

  expose_decorated :user
  expose_decorated :users, -> { User.sorted.includes(:department) }
  expose_decorated :invites, -> { fetch_invites }

  def show
    @results = Results.new(assessment)
  end

  def create
    assessment.user = user
    assessment.save

    redirect_to user_assessments_path(user)
  end

  def update
    assessment.update(assessment_params)

    redirect_to user_assessments_path(user)
  end

  def destroy
    assessment.update(deleted_at: Time.zone.now)

    redirect_to user_assessments_path(user)
  end

  private

  def assessment_params
    params.require(:assessment).permit(:user_id, :date, :requested_role)
  end

  def authorize!
    authorize params[:action] == "index" ? user : assessment, "#{params[:action]}?"
  end

  def fetch_invites
    assessment.invites.includes(:feedback, user: :department)
  end

  def fetch_skills
    Skill.active.where(role: assessment.requested_role, department: [assessment.user.department, nil])
  end
end
