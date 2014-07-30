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
  @browser = browser
end

at_exit do
  browser.close
end

module AddDepartmentHelper
  def department_name=(name)
    @department_name = name
  end

  def department_name
    @department_name
  end
end

World(AddDepartmentHelper)
