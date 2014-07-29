Given(/that I am logged in as a (\w+\s*\w+)/) do |user|
  @browser.goto 'https://bluesourcestaging.herokuapp.com'
  user = user.split(' ').join('.')
  @browser.text_field(id: 'employee_username').set user
  @browser.text_field(id: 'employee_password').set 'password'
  @browser.button(value: 'Login').click
end

And(/I navigated? to the (\w+\s*\w*) page/) do |page|
  if page.split(' ').length > 1
    page = page.split(' ')
    main_link = page[0]
    sub_link = page[1]
    @browser.link(href: '#', text: main_link).click
    @browser.link(text: /#{sub_link}/i).click
  else
    @browser.link(text: /#{page}/i).click
  end
end
