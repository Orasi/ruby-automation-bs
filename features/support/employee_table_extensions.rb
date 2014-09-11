# Helper methods for manipulating the employee table
module EmployeeTable
  def goto_next_page
    result = true
    next_button = @browser.ul(class: 'pagination').link(text: '»')
    @browser.table(class: 'table').wait_until_present(5)
    page_info = @browser.p(class: 'pull-right ng-binding').text.split
    page_info[2] == page_info[4] ? result = false : next_button.click
    @browser.table(class: 'table').wait_until_present(5)
    result
  end

  def verify_table_count
    # toggle the page counts to make sure the site is on page 1
    @browser.select_list(id: 'employee_preferences_resourcesPerPage').select_value('5')
    @browser.select_list(id: 'employee_preferences_resourcesPerPage').select_value('20')
    # loop through each page to get the total employee count.
    total_rows = 0
    loop do
      @browser.table(class: 'table').wait_until_present(5)
      total_rows = total_rows + @browser.table(class: 'table').rows.count - 1
      break unless goto_next_page
    end
    total_rowsg
  end
end

World(EmployeeTable)
