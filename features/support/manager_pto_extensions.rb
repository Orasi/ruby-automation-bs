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
    trash_icon = @browser.element(class: 'glyphicon-trash', index: 0)
    while trash_icon.present?
      trash_icon.click
      @browser.alert.wait_until_present(10)
      @browser.alert.ok
      @browser.element(class: 'table').wait_until_present(10)
    end
    puts 'Cleared time off for employee'
  end
end

World(ManagerPtoHelpers)
