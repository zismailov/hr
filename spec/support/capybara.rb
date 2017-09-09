Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    phantomjs_logger: Rails.root.join("log", "poltergeist.log"),
    inspector: true
  )
end

Capybara.javascript_driver = :poltergeist
Capybara.ignore_hidden_elements = true

Capybara.default_max_wait_time = 5
Capybara.register_server :puma do |app, port|
  require "puma"
  Puma::Server.new(app).tap do |s|
    s.add_tcp_listener Capybara.server_host, port
  end.run.join
  port = 3001
end
