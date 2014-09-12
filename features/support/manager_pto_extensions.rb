# Helper methods for the manage_pto_steps
module ManagerPtoHelpers
  def goto_employee_summary
    employee = "#{@employee[:first_name]} #{@employee[:last_name]}"
    @browser.text_field(id: 'search-bar').set employee
    table = @browser.table(class: 'table')
    table.wait_until_present(10)
    table.to_a.each_with_index do |user, i| # rubocop:disable Style/Next
      found = user[0] == @employee[:first_name] && user[1] == @employee[:last_name]
      table[i][0].link.click if found
      break if found
    end
    @browser.element(text: 'General Info').wait_until_present(10)
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
