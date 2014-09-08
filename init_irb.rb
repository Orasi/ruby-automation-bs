require 'watir-webdriver'
require 'rspec/expectations'
require 'headless'

# load the external functions to have access to the screenshot function
load './features/step_definitions/external_functions.rb'

puts 'Creating headless instance'
headless = Headless.new
headless.start

puts 'Creating browser instance'
browser = Watir::Browser.new :firefox
@browser = browser

puts 'Logging into Blue Source as company.admin'
@browser.goto 'https://bluesourcestaging.herokuapp.com'
@browser.text_field(id: 'employee_username').wait_until_present(5)
@browser.text_field(id: 'employee_username').set 'company.admin'
@browser.text_field(id: 'employee_password').set 'password' 
@browser.button(value: 'Login').click
@browser.element(text: 'Logout').wait_until_present(5)
@browser.table(class: 'table').wait_until_present(5)
take_screenshot('Browser_Loaded')
puts 'Browser loaded and startup complete!'
puts 'The @browser instance variable is now available'
puts 'See the Browser_Loaded screenshot for an image of the browser state.'