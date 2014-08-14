Given(/that I am logged in as a (\w+\s*\w+)/) do |user|
  login_as_user(user)
end

Given(/that I am logged in as (\w+\s*\w+)/) do |user|
  login_as_user(user)
end

And(/I navigated to the (\w*) page/) do |page|
  @browser.element(class: 'navbar').link(text: /#{page}/i).click
end

Given(/I navigate to the (\w*) page/) do |page|
  @browser.element(class: 'navbar').link(text: /#{page}/i).click
end

And(/I navigate to the (\w*) page/) do |page|
  @browser.element(class: 'navbar').link(text: /#{page}/i).click
end

# rubocop:disable Style/MethodLength
def login_as_user(user)
  case user
  when 'user'
    user = 'test.user'
  when 'manager'
    user = 'david.quach'
  when 'dept head'
    user = 'dept.head'
  when 'dept admin'
    user = 'dept.admin'
  when 'company admin'
    user = 'company.admin'
  else
    user = user.split(' ').join('.')
  end

  @browser.goto 'https://bluesourcestaging.herokuapp.com'
  @browser.text_field(id: 'employee_username').set user
  @browser.text_field(id: 'employee_password').set 'password'
  @browser.button(value: 'Login').click
  @browser.element(text: 'Logout').wait_until_present
end
# rubocop:enable Style/MethodLength
