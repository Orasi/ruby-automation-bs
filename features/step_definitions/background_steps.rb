Given(/that I am logged in as (.*)/i) do |user|
  # select the appropriate user
  if user == 'user'
    user = 'test.user'
  elsif user.include? 'manager'
    user = 'manager.test'
    @user = { first: 'Manager-Test', last: 'User', username: user }
  elsif user.include? 'dept head'
    user = 'dept.head'
    @user = { first: 'Department-Head', last: 'User', username: user }
  elsif user.include? 'dept admin'
    user = 'dept.admin'
    @user = { first: 'Department-Admin', last: 'User', username: user }
  elsif user.include? 'company admin'
    user = 'company.admin'
    @user = { first: 'Company', last: 'Admin', username: user }
  else
    user = user.split(' ').join('.')
    @user = { first: user.split[0], last: user.split[1], username: user }
  end

  # login to the site
  @browser.goto 'https://bluesourcestaging.herokuapp.com'
  @browser.text_field(id: 'employee_username').set user
  @browser.text_field(id: 'employee_password').set 'password'
  @browser.button(value: 'Login').click
  @browser.element(text: 'Logout').wait_until_present(10)
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
