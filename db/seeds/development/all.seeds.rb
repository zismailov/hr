FactoryGirl.create(:user, :hr, department_id: nil)

5.times { FactoryGirl.create(:user, :manager, level: rand(1..3), department_id: nil) }

2.times { FactoryGirl.create(:user, :lead_dev, level: rand(1..3), department_id: 1) }
2.times { FactoryGirl.create(:user, :lead_dev, level: rand(1..3), department_id: 3) }
2.times { FactoryGirl.create(:user, :lead_dev, level: rand(1..3), department_id: 4) }

5.times { FactoryGirl.create(:user, :senior_dev, level: rand(1..3), department_id: 1) }
5.times { FactoryGirl.create(:user, :senior_dev, level: rand(1..3), department_id: 3) }
5.times { FactoryGirl.create(:user, :senior_dev, level: rand(1..3), department_id: 4) }

7.times { FactoryGirl.create(:user, :middle_dev, level: rand(1..3), department_id: 1) }
7.times { FactoryGirl.create(:user, :middle_dev, level: rand(1..3), department_id: 3) }
7.times { FactoryGirl.create(:user, :middle_dev, level: rand(1..3), department_id: 4) }

10.times { FactoryGirl.create(:user, :junior_dev, level: rand(1..3), department_id: 1) }
10.times { FactoryGirl.create(:user, :junior_dev, level: rand(1..3), department_id: 3) }
10.times { FactoryGirl.create(:user, :junior_dev, level: rand(1..3), department_id: 4) }
