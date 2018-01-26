departments = [
  "Android",
  "Front-end",
  "iOS",
  "Ruby",
  "Design"
].each do |department|
  Department.create title: department
end

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

# Личностные качества, Junior Developer
FactoryGirl.create(:skill, title: "Общение с заказчиком", department_id: nil, role: "Junior Developer", description: "Знает заказчика и цели проекта.")

# Личностные качества, Middle Developer
FactoryGirl.create(:skill, title: "Общение с заказчиком", department_id: nil, role: "Middle Developer", description: "Выясняет письменно детали задачи в таск трекере. Знает последние требования в проекте.")

# Личностные качества, Senior Developer
FactoryGirl.create(:skill, title: "Общение с заказчиком", department_id: nil, role: "Senior Developer", description: "Регулярно общается с заказчиком как в рамках проекта, так и на общие темы. Знает особенности бизнеса заказчика в рамках проекта. Предлагает выгодное для заказчика развитие проекта.")

# Личностные качества, Lead Developer
FactoryGirl.create(:skill, title: "Общение с заказчиком", department_id: nil, role: "Lead Developer", description: "Регулярно общается с заказчиком как в рамках проекта, так и на общие темы. Знает особенности бизнеса заказчика в рамках проекта. Предлагает выгодное для заказчика развитие проекта.")

# Android, Junior Developer
FactoryGirl.create(:skill, title: "Java", department_id: 1, role: "Junior Developer", description: "Знает основы языка. Знает основы ООП. Использует наследование там, где это нужно. Знает коллекции данных")

# Front-end, Junior Developer
FactoryGirl.create(:skill, title: "HTML", department_id: 2, role: "Junior Developer", description: "Cемантичный код на уровне базовых тэгов (div, span, p, strong, h*, ul, li, em, i, a). Понимает разницу между class, id. Умеет использовать data-attr. Знаком хотя бы с одним шаблонизатором (haml | slim | jade).")

# iOS, Junior Developer
FactoryGirl.create(:skill, title: "Xcode", department_id: 3, role: "Junior Developer", description: "Умеет создавать новый проект. Умеет создавать новые файлы. Умеет добавлять новые ресурсы в проект. Умеет пользоваться debugger'ом.")

# Ruby, Junior Developer
FactoryGirl.create(:skill, title: "Ruby", department_id: 4, role: "Junior Developer", description: "Знает консольные инструменты: irb, ruby, gem, rake, bundler. Знает базовый синтаксис: методы, управляющие структуры, исключения, классы, наследование, модули.")

# Android, Middle Developer
FactoryGirl.create(:skill, title: "Java", department_id: 1, role: "Middle Developer", description: "Использует RxJava. Использует абстрактные классы. Знает основные структуры данных")

# Front-end, Middle Developer
FactoryGirl.create(:skill, title: "HTML", department_id: 2, role: "Middle Developer", description: "Семантичный код в рамках HTML5 (header, footer, article, section, nav, aside, menu). Способен использовать разные шаблонизаторы под нужды проекта. Использует \"cliend-side\" и \"server-side\" шаблоны. Понимает aria, role.")

# iOS, Middle Developer
FactoryGirl.create(:skill, title: "Xcode", department_id: 3, role: "Middle Developer", description: "Умеет настраивать проект.  Умеет подключать библиотеки. Разбирается с прописыванием путей до библиотек. Умеет ставить правильные сертификаты/профайлы. Умеет архивировать проект и создавать .ipa файл. Умеет выкладывать билды в AppStore. Использует макросы.")

# Ruby, Middle Developer
FactoryGirl.create(:skill, title: "Ruby", department_id: 4, role: "Middle Developer", description: "Понимает и умеет пользоваться yield. Понимает и умеет пользоваться Kernel#define_method, Kernel#method_missing. Умеет вызывать методы классов динамически, используя Kernel#send, Kernel#public_send, знает их различие. Умеет пользоваться Module#include, Module#extend. Умеет пользоваться лямбдами и проками. Умеет создавать и понимает, как работают Rake таски.")

# Android, Senior Developer
FactoryGirl.create(:skill, title: "Java", department_id: 1, role: "Senior Developer", description: "Свободно использует RxJava. Знает быстрые алгоритмы разных структурах данных. Умеет пользоваться рефлексией. Базовое знание о написании аннотаций и их процессоров.")

# Front-end, Senior Developer
FactoryGirl.create(:skill, title: "CSS", department_id: 2, role: "Senior Developer", description: "При необходимости может следовать любой методологии. Умеет работать с legacy-кодом и адекватно оценивает необходимость рефакторинга. Знает особенности рендеринга у различных браузеров.")

# iOS, Middle Developer
FactoryGirl.create(:skill, title: "Xcode", department_id: 3, role: "Senior Developer", description: "Свободно ориентируется в Xcode. Умеет создавать новые схемы. Умеет создавать новые конфигурации. Умеет добавлять скрипты в этапы компиляции. Использует все инструменты, поставляемые с Xcode. Подключает плагины к Xcode. Использует сторонние инструменты.")

# Ruby, Senior Developer
FactoryGirl.create(:skill, title: "Ruby", department_id: 4, role: "Senior Developer", description: "Создание Gems. Garbage Collector – как работает, настройка (https://tunemygc.com). Бенчмаркинг Ruby кода, профилирование памяти (rack-mini-profiler, stackprof, scout) Треды, дедлоки, рейс кондишн, мутексы, память. Процессы, форк, память. Общее представление о нейтив экстеншенах.")
