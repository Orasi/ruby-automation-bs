When(/I change the number of employees viewed per page to (\d+)/) do |pages|
  @browser.select_list(id: 'employee_preferences_resourcesPerPage').select pages
end

Then(/the employee table should show the first (\d+) employees/) do |pages|
  pages = pages.to_i
  @browser.table(class: 'table').wait_until_present
  row_count = @browser.table(class: 'table').trs.count - 1
  total_employee_count = @browser.div(id: 'resource-content')
                                 .divs[1].p.text.split('of')
                                 .last.to_i
  if total_employee_count >= pages
    expect(row_count).to eq(pages)
  else
    expect(row_count).to be <= pages
  end
end
