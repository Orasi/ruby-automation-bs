def goto_employee_summary
  employee = "#{@employee[:first_name]} #{@employee[:last_name]}"
  @browser.text_field(id: 'search-bar').set employee
  table = @browser.table(class: 'table')
  table.wait_until_present(5)
  table.to_a.each_with_index do |user, i| # rubocop:disable Style/Next
    found = user[0] == @employee[:first_name] && user[1] == @employee[:last_name]
    table[i][0].link.click if found
    break if found
  end
  @browser.element(text: 'General Info').wait_until_present(5)
end

def clear_time_off
  trash_icon = @browser.element(class: 'glyphicon-trash', index: 0)
  while trash_icon.present?
    trash_icon.click
    @browser.alert.wait_until_present(5)
    @browser.alert.ok
    @browser.element(class: 'table').wait_until_present(5)
  end
  puts 'Cleared time off for employee'
end

def goto_next_page
  result = true
  next_button = @browser.ul(class: 'pagination').link(text: '»')
  @browser.table(class: 'table').wait_until_present(5)
  page_info = @browser.p(class: 'pull-right ng-binding').text.split
  page_info[2] == page_info[4] ? result = false : next_button.click
  @browser.table(class: 'table').wait_until_present(5)
  result
end

def take_screenshot(text = 'screenshot')
  time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
  @browser.screenshot.save "./screenshots/#{text}_#{time}.png"
end

def verify_table_count
  # toggle the page counts to make sure the site is on page 1
  @browser.select_list(id: 'employee_preferences_resourcesPerPage').select_value('5')
  @browser.table(class: 'table').wait_until_present(5)
  @browser.select_list(id: 'employee_preferences_resourcesPerPage').select_value('20')
  sleep 1
  continue = true
  i = 0
  total_rows = 0
  # loop through each page to get the total employee count.
  while continue
    i += 1
    @browser.table(class: 'table').wait_until_present(5)
    total_rows = total_rows + @browser.table(class: 'table').rows.count - 1
    continue = goto_next_page
  end
  total_rows
end  
