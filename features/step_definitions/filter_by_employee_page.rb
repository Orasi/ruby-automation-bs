When(/^I filter using the direct button$/) do
  @browser.element(class: 'btn', text: 'Direct').click
  @browser.table(class: 'table').wait_until_present(5)
end

Then(/^the employee table should show only direct reports$/) do
  expected_supervisor = @user[:first] + ' ' + @user[:last]
  table = @browser.table(class: 'table')
  (1..table.rows.count-1).each_with_index do |i|
    actual_supervisor = table[i][3].text
    expect(actual_supervisor).to eq(expected_supervisor)
  end
end