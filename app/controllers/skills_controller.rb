class SkillsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose_decorated :skill
  expose_decorated :skills, -> { Skill.all.includes(:department) }

  def create
    skill.save
    respond_with(skill)
  end

  def update
    skill.update_attributes(skill_params)
    respond_with(skill)
  end

  def destroy
    skill.deleted_at = Time.zone.now

    skill.destroy
    respond_with(skill)
  end

  private

  def skill_params
    params.require(:skill).permit(:description, :department_id)
  end
end
