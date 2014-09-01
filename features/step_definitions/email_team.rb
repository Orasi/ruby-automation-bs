When(/I select the email team button/i) do
  email_button = @browser.element(text: 'Email team')
  email_button.wait_until_present(5)
  @email_list = email_button.link.href.sub('mailto:', '').split(';%20')
end

Then(/I should be able to send an email to my active direct reports/i) do
  # display 20 per page and sort by Supervisor
  @browser.select_list(id: 'employee_preferences_resourcesPerPage').select_value('20')
  @browser.link(text: 'Supervisor').click
  @browser.link(text: 'Supervisor').click

  # go through all the results to get the links to all
  # of the users that report to the current user
  reporting_users = Array.new
  loop do
    # get an array of the table
    user_table = @browser.table(class: 'table')
    user_array = user_table.to_a

    # get all of the relevant users
    user_array.each_with_index do |user, i| # rubocop:disable Style/Next
      if user[3] == @user[:first] + ' ' + @user[:last]
        reporting_users << user_table[i][0].link.href
      end
    end

    # break if the last user's supervisor field is blank or on the last page of results
    page_info = @browser.p(class: 'pull-right ng-binding').text.split
    break if user_array[-1][3] == ''
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
