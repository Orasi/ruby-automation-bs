Given(/that I am logged in as a (.*)$/i) do |user|
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
  login_page.open
  login_page.login_with user, 'password'
  home_page.wait_until 10 do
    home_page.logout?
  end
end

And(/I navigated? to the (\w+\s*\w*) page$/) do |page|
  if page == 'employee summary'
    goto_employee_summary
  elsif page == 'manage pto'
    @browser.element(class: 'btn', text: 'Manage', index: 2).click
  else
    home_page.navigate_to(page)
  end
end
