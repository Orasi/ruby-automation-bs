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
    title = scenario.scenario_outline.feature.title
    name = scenario.name.gsub('|', '').strip
    screenshot = "./screenshots/FAILED_#{title}_#{name}.png"
    @browser.screenshot.save screenshot
  end
end

at_exit do
  browser.close
end
