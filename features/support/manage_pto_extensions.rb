# Helper methods for the manage_pto_steps
module ManagerPtoHelpers
  def goto_employee_summary
    employee = "#{@employee[:first_name]} #{@employee[:last_name]}"
    employee_page.search_employee = employee
    table = employee_page.employee_table_element
    table.when_present(10)
    table.to_a.each_with_index do |user, i| # rubocop:disable Style/Next
      found = user[0].text + ' ' + user[1].text == employee
      table[i][0].link_element.click if found
      break if found
    end
    employee_summary_page.general_info_header_element.when_present(10)
  end

  def clear_time_off
    while employee_summary_page.delete_request?
      employee_summary_page.delete_request_element.click
      @browser.alert.wait_until_present(10)
      @browser.alert.ok
      employee_time_off_page.vacation_table.when_present(10)
    end
    puts 'Cleared time off for employee'
  end
end

World(ManagerPtoHelpers)
