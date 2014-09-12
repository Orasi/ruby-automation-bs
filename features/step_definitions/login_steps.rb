Given(/I enter a valid (\w+) and password/i) do |login_with|
  login_page.open

  if login_with == 'username'
    login_page.username = 'david.quach'
  else
    login_page.username = 'david.quach@orasi.com'
  end

  login_page.password = 'pass'
end

Given(/I fill in only the (\w+) field/i) do |field|
  login_page.open

  if field == 'username'
    login_page.username = 'david.quach'
  else
    login_page.password = 'pass'
  end

end

When(/I log into Bluesource/) do
  login_page.login
end

Then(/I should land on the homepage/) do
  expect(home_page.logout?).to be true
end

Then(/I should not be logged in/) do
  expect(login_page.login_help?).to be true
end
