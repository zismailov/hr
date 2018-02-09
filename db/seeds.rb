%w(Android Front-end iOS Ruby Design).each {|title| Department.create title: title }

# Личностные качества, junior_dev
Skill.create title: "Общение с заказчиком", department_id: nil, role: "junior_dev", description: "Знает заказчика и цели проекта."

# Личностные качества, middle_dev
Skill.create title: "Общение с заказчиком", department_id: nil, role: "middle_dev", description: "Выясняет письменно детали задачи в таск трекере. Знает последние требования в проекте."

# Личностные качества, senior_dev
Skill.create title: "Общение с заказчиком", department_id: nil, role: "senior_dev", description: "Регулярно общается с заказчиком как в рамках проекта, так и на общие темы. Знает особенности бизнеса заказчика в рамках проекта. Предлагает выгодное для заказчика развитие проекта."

# Личностные качества, lead_dev
Skill.create title: "Общение с заказчиком", department_id: nil, role: "lead_dev", description: "Регулярно общается с заказчиком как в рамках проекта, так и на общие темы. Знает особенности бизнеса заказчика в рамках проекта. Предлагает выгодное для заказчика развитие проекта."

# Android, junior_dev
Skill.create title: "Java", department_id: 1, role: "junior_dev", description: "Знает основы языка. Знает основы ООП. Использует наследование там, где это нужно. Знает коллекции данных"

# Front-end, junior_dev
Skill.create title: "HTML", department_id: 2, role: "junior_dev", description: "Cемантичный код на уровне базовых тэгов (div, span, p, strong, h*, ul, li, em, i, a. Понимает разницу между class, id. Умеет использовать data-attr. Знаком хотя бы с одним шаблонизатором (haml | slim | jade."

# iOS, junior_dev
Skill.create title: "Xcode", department_id: 3, role: "junior_dev", description: "Умеет создавать новый проект. Умеет создавать новые файлы. Умеет добавлять новые ресурсы в проект. Умеет пользоваться debugger'ом."

# Ruby, junior_dev
Skill.create title: "Ruby", department_id: 4, role: "junior_dev", description: "Знает консольные инструменты: irb, ruby, gem, rake, bundler. Знает базовый синтаксис: методы, управляющие структуры, исключения, классы, наследование, модули."

# Android, middle_dev
Skill.create title: "Java", department_id: 1, role: "middle_dev", description: "Использует RxJava. Использует абстрактные классы. Знает основные структуры данных"

# Front-end, middle_dev
Skill.create title: "HTML", department_id: 2, role: "middle_dev", description: "Семантичный код в рамках HTML5 (header, footer, article, section, nav, aside, menu. Способен использовать разные шаблонизаторы под нужды проекта. Использует \"cliend-side\" и \"server-side\" шаблоны. Понимает aria, role."

# iOS, middle_dev
Skill.create title: "Xcode", department_id: 3, role: "middle_dev", description: "Умеет настраивать проект.  Умеет подключать библиотеки. Разбирается с прописыванием путей до библиотек. Умеет ставить правильные сертификаты/профайлы. Умеет архивировать проект и создавать .ipa файл. Умеет выкладывать билды в AppStore. Использует макросы."

# Ruby, middle_dev
Skill.create title: "Ruby", department_id: 4, role: "middle_dev", description: "Понимает и умеет пользоваться yield. Понимает и умеет пользоваться Kernel#define_method, Kernel#method_missing. Умеет вызывать методы классов динамически, используя Kernel#send, Kernel#public_send, знает их различие. Умеет пользоваться Module#include, Module#extend. Умеет пользоваться лямбдами и проками. Умеет создавать и понимает, как работают Rake таски."

# Android, senior_dev
Skill.create title: "Java", department_id: 1, role: "senior_dev", description: "Свободно использует RxJava. Знает быстрые алгоритмы разных структурах данных. Умеет пользоваться рефлексией. Базовое знание о написании аннотаций и их процессоров."

# Front-end, senior_dev
Skill.create title: "CSS", department_id: 2, role: "senior_dev", description: "При необходимости может следовать любой методологии. Умеет работать с legacy-кодом и адекватно оценивает необходимость рефакторинга. Знает особенности рендеринга у различных браузеров."

# iOS, middle_dev
Skill.create title: "Xcode", department_id: 3, role: "senior_dev", description: "Свободно ориентируется в Xcode. Умеет создавать новые схемы. Умеет создавать новые конфигурации. Умеет добавлять скрипты в этапы компиляции. Использует все инструменты, поставляемые с Xcode. Подключает плагины к Xcode. Использует сторонние инструменты."

# Ruby, senior_dev
Skill.create title: "Ruby", department_id: 4, role: "senior_dev", description: "Создание Gems. Garbage Collector – как работает, настройка (https://tunemygc.com. Бенчмаркинг Ruby кода, профилирование памяти (rack-mini-profiler, stackprof, scout Треды, дедлоки, рейс кондишн, мутексы, память. Процессы, форк, память. Общее представление о нейтив экстеншенах."
