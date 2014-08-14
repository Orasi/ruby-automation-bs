Given(/that I am logged in as (.*)/i) do |user|
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
  if user == 'user'
    user = 'test.user'
  elsif user.include? 'manager'
    user = 'david.quach'
  elsif user.include? 'dept head'
    user = 'dept.head'
  elsif user.include? 'dept admin'
    user = 'dept.admin'
  elsif user.include? 'company admin'
    user = 'company.admin'
  else
    user = user.split(' ').join('.')
  end

  @browser.goto 'https://bluesourcestaging.herokuapp.com'
  @browser.text_field(id: 'employee_username').set user
  @browser.text_field(id: 'employee_password').set 'password'
  @browser.button(value: 'Login').click
  @browser.element(text: 'Logout').wait_until_present(10)
end
# rubocop:enable Style/MethodLength
