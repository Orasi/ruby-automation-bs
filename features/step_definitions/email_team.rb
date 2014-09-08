When(/I select the email team button/i) do
  email_button = @browser.element(text: 'Email team')
  email_button.wait_until_present(5)
  @email_list = email_button.link.href.sub('mailto:', '').split(';')
end

Then(/I should be able to send an email to my active direct reports/i) do
  # display 20 per page and show only Direct
  @browser.select_list(id: 'employee_preferences_resourcesPerPage').select_value('20')
  @browser.element(class: 'btn', text: 'Direct').click
  @browser.table(class: 'table').wait_until_present(5)

  # go through all the results to get the links to all
  # of the users that report to the current user
  reporting_users = Array.new
  loop do
    # get an array of the table
    user_table = @browser.table(class: 'table')

    # get all of the users
    (1..user_table.rows.count - 1).each do |i|
      reporting_users << user_table[i][0].link.href
    end

    # break if the on the last page of results
    page_info = @browser.p(class: 'pull-right ng-binding').text.split
    break if page_info[2] == page_info[4]

    # go to the next page of results
    click_link('»')
  end

  # loop through the list of reporting users to get their email addresses
  reporting_users.each do |link|
    @browser.goto(link)
    user_table = @browser.table(class: 'table')

    # remove the current users email from the email_button list
    @email_list.delete(user_table[10][1].text)
  end

  # verify the email_button list is now empty
  expect(@email_list.count).to eq(0)

end