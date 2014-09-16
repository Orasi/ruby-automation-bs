And(/I note the Time Off Details on the employee summary page$/i) do
  @browser.element(text: 'Time Off Info').click
  table = @browser.table(class: 'table', index: 2)
  table.wait_until_present(10)
  @time_off_summary = table.to_a
end

When(/I enter a (Vacation|Sick|Floating Holiday|Other) request for a (\w+) day that starts on (\d+\-\d+\-\d+) and ends (\d+\-\d+\-\d+)$/i) do |type, duration, start_date, end_date| # rubocop:disable Style/LineLength
  # add the time off
  @browser.input(name: 'new[vacation][start_date]').to_subtype.set start_date
  sleep 1
  @browser.input(name: 'new[vacation][end_date]').to_subtype.set end_date
  sleep 1
  @browser.select_list(id: 'new_vacation_vacation_type').select type
  if type == 'Other'
    @browser.select_list(id: 'new_vacation_vacation_type').fire_event 'onmouseover'
    @browser.text_field(name: 'new[vacation][reason]').wait_until_present(2)
    @browser.text_field(name: 'new[vacation][reason]').set 'testing'
  end
  @browser.element(class: 'btn', text: 'Half Day').click if duration == 'Half'
  @browser.button(text: 'Save Time Off').click
  @browser.div(class: 'alert-success').wait_until_present(10)
end

Then(/the PTO request should be saved$/) do
  expect(@browser.text).to include('Time off successfully saved.')
  @browser.buttons(class: 'close')[0].click
end
