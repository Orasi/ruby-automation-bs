Given(/that I am logged in as a (\w+\s*\w+)/) do |user|
  @browser.goto 'https://bluesourcestaging.herokuapp.com'
  user = user.split(' ').join('.')
  @browser.text_field(id: 'employee_username').set user
  @browser.text_field(id: 'employee_password').set 'password'
  @browser.button(value: 'Login').click
end

And(/I navigated to the (\w*) page/) do |page|
  @browser.element(class: 'navbar').link(text: /#{page}/i).click
end
