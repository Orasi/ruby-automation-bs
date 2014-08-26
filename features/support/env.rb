require 'watir-webdriver'
require 'rspec/expectations'

if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end

browser = Watir::Browser.new :firefox

Before do
  @headless = headless
  @browser = browser
end

After do |scenario|
  if scenario.failed?
    screenshot = "./screenshots/FAILED_#{scenario.scenario_outline.feature.title}_#{scenario.name.gsub("|", "").strip}.png"
    @browser.screenshot.save screenshot
  end
end

at_exit do
  browser.close
end
