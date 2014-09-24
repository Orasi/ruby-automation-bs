require 'watir-webdriver'
require 'rspec/expectations'
require 'page-object'

if ENV['HEADLESS']
  require 'headless'
  Kernel.puts 'Starting headless...'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end

Kernel.puts 'Starting browser...'
browser = Watir::Browser.new :firefox

Before do
  @browser = browser
end

at_exit do
  browser.close
end
