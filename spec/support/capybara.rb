RSpec.configure do |config|
  configu.before(:each, type: :system) do
    driven_by :rack_test
  end
end

config.before(:each, type: :system, js: true) do
  driven_by :selenium_chrome_headless
end
