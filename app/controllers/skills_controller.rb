class SkillsController < ApplicationController
  expose_decorated :skill
  expose_decorated :skills, -> { Skill.active.includes(:department) }

  def create
    skill.save
    respond_with skill, location: skills_path
  end

  def update
    skill.update(skill_params)
    respond_with skill
  end

  def destroy
    skill.update(deleted_at: Time.zone.now)

    redirect_to skills_path, notice: "Навык был успешно заархивирован"
  end

  private

  def skill_params
    params.require(:skill).permit(:title, :department_id, :description, :role)
  end
end
