FactoryGirl.create(:user, :hr)

10.times { FactoryGirl.create(:user, :manager, level: rand(5)) }

10.times { FactoryGirl.create(:user, :lead_dev, level: rand(5)) }

15.times { FactoryGirl.create(:user, :senior_dev, level: rand(5)) }

20.times { FactoryGirl.create(:user, :middle_dev, level: rand(5)) }

30.times { FactoryGirl.create(:user, :junior_dev, level: rand(5)) }

skills = [
  "Ruby",
  "Ruby on Rails / Back-end",
  "Front-end",
  "*NIX OS system administration",
  "Общение с заказчиком",
  "Общение с командой",
  "Ориентированность на результат",
  "Развитие",
  "Дисциплированность"
].each do |skill_description|
  Skill.create description: skill_description
end
