When(/I change the number of employees viewed per page to (\d+)/) do |number|
  employee_page.employee_per_page = number
end

Then(/the employee table should show the first (\d+) employees/) do |pages|
  pages = pages.to_i
  row_count = employee_page.employee_table_element.when_visible.rows - 1
  if employee_page.total_employee_results >= pages
    expect(row_count).to eq(pages)
  else
    expect(row_count).to be <= pages
  end
end
