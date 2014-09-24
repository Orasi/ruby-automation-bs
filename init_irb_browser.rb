require 'watir-webdriver'
require 'headless'


# define the screenshot function
def take_screenshot(text = 'screenshot')
  time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
  @browser.screenshot.save "./screenshots/#{text}_#{time}.png"
end

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

puts 'Browser loaded and initilization complete!'
puts 'The @browser instance variable is now available for use.'
puts 'See the Browser_Loaded image in the ./screenshots directory'
puts 'for verification of browser state.'
puts 'Use the take_screenshot method to capture an image of the current browser state.'
