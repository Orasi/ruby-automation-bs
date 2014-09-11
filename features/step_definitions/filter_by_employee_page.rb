When(/^I filter using the all button$/) do
  @browser.element(class: 'btn', text: 'All').click
  @browser.table(class: 'table').wait_until_present(5)
end

Then(/^the employee table should show all employees$/) do
  total_employees =  @browser.p(class: 'pull-right ng-binding').text.split[4].to_i
  expect(verify_table_count).to eq(total_employees)
end

When(/^I filter using the show inactives button$/) do
  @browser.element(class: 'btn', text: 'Show Inactives').click
  @browser.table(class: 'table').wait_until_present(5)
end

Then(/^the employee table should show only the inactive employees$/) do
  pending # This step is on hold because the functionality isn't implemented yet.
end

When(/^I filter using the direct button$/) do
  @browser.element(class: 'btn', text: 'Direct').click
  @browser.table(class: 'table').wait_until_present(5)
end

Then(/^the employee table should show only direct reports$/) do
  @browser.select_list(id: 'employee_preferences_resourcesPerPage').select_value('20')
  expected_supervisor = @user[:first] + ' ' + @user[:last]
  while goto_next_page
    table = @browser.table(class: 'table')
    (1..table.rows.count - 1).each_with_index do |i|
      actual_supervisor = table[i][3].text
      expect(actual_supervisor).to eq(expected_supervisor)
    end
  end
end
