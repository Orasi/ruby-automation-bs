When(/I select the email team button/i) do
  @browser.element(text: 'Email team').wait_until_present(5)
  @browser.element(text: 'Email team').click
end
Then(/I should be able to send an email to my active direct reports/i) do
  pending 'Need to determine how this verification will be done'
end
