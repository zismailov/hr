source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pg", "~> 0.18"
gem "rails", "~> 5.1.3"

# assets
gem "autoprefixer-rails"
gem "coffee-rails", "~> 4.2"
gem "foundation-icons-sass-rails"
gem "foundation-rails"
gem "jquery-datatables-rails", "~> 3.4.0"
gem "jquery-rails"
gem "premailer-rails"
gem "sass-rails", "~> 5.0"
gem "skim"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 1.3.0"

# views
gem "active_link_to"
gem "inky-rb", require: "inky"
gem "metamagic"
gem "simple_form"
gem "slim"

# all other gems
gem "decent_decoration"
gem "decent_exposure"
gem "devise"
gem "draper"
gem "flamegraph"
gem "google-analytics-rails"
gem "health_check"
gem "interactor"
gem "kaminari"
gem "memory_profiler"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "puma", "~> 3.7"
gem "pundit"
gem "rack-canonical-host"
gem "rack-mini-profiler", require: false
gem "rails-i18n"
gem "responders"
gem "rollbar"
gem "seedbank"
gem "stackprof"

group :staging, :production do
  gem "newrelic_rpm"
  gem "rails_stdout_logging"
end

group :test do
  gem "capybara"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "launchy"
  gem "poltergeist"
  gem "rspec-its"
  gem "shoulda-matchers"
  gem "webmock", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "pry"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  gem "bullet"
  gem "foreman", require: false
  gem "letter_opener"
  gem "listen"
  gem "rails-erd"
  gem "slim-rails"
end
