departments = [
  "Ruby",
  "Android",
  "Front-end",
  "iOS",
  "Design"
].each do |department|
  Department.create title: department
end

FactoryGirl.create(:user, :hr, department_id: nil)

10.times { FactoryGirl.create(:user, :manager, level: rand(5), department_id: nil) }

10.times { FactoryGirl.create(:user, :lead_dev, level: rand(5), department_id: 1) }

15.times { FactoryGirl.create(:user, :senior_dev, level: rand(5), department_id: 1) }

20.times { FactoryGirl.create(:user, :middle_dev, level: rand(5), department_id: 2) }

30.times { FactoryGirl.create(:user, :junior_dev, level: rand(5), department_id: 3) }

ruby_skills = [
  "Ruby",
  "Rails",
  "Agile"
].each do |skill_description|
  Skill.create description: skill_description, department_id: 1
end

android_skills = [
  "Java",
  "XML",
  "Android SDK"
].each do |skill_description|
  Skill.create description: skill_description, department_id: 2
end

front_end_skills = [
  "HTML",
  "CSS",
  "JavaScript"
].each do |skill_description|
  Skill.create description: skill_description, department_id: 3
end

ios_skills = [
  "Xcode",
  "Objective C / Swift",
  "Certs / IDs"
].each do |skill_description|
  Skill.create description: skill_description, department_id: 4
end

design_skills = [
  "???"
].each do |skill_description|
  Skill.create description: skill_description, department_id: 5
end
