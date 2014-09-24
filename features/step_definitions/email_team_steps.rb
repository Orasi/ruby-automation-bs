When(/I select the email team button/i) do
  employee_page.email_team_element.when_visible(10)
  @email_list = employee_page.email_list
end

Then(/I should be able to send an email to my active direct reports/i) do
  # display 20 per page and show only Direct
  employee_page.employee_per_page = 20
  employee_page.direct_element.click

  # go through the results to get the links to all
  # of the users that report to the current user
  user_table = employee_page.employee_table_element
  user_table.when_visible(10)
  reporting_users = Array.new
  loop do
    (1..user_table.rows - 1).each do |i|
      reporting_users << user_table[i][0].link_element.href
    end
    break unless goto_next_page
  end

  # loop through the list of reporting users to
  # and remove their email addresses from the email list
  reporting_users.each do |link|
    @browser.goto(link)
    @email_list.delete(employee_summary_page.employee_email)
  end

  # verify the email_button list is now empty
  expect(@email_list.count).to eq(0)

end
