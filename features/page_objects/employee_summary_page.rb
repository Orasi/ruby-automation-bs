# Objects on the employee page
class EmployeeSummaryPage
  include PageObject

  # Objects on the page
  h4(:general_info_header, class: 'panel-title', text: 'General Info')
  h4(:project_info_header, class: 'panel-title', text: 'Project Info')
  h4(:time_off_info_header, class: 'panel-title', text: 'Time Off Info')
  button(:close, class: 'close')
  button(:manage_general_info, data_target: '#modal_1')
  element(:manage_project_info, :a, text: 'Manage', index: 0, class: 'btn btn-default btn-xs no-collapse') # rubocop:disable Style/LineLength
  element(:manage_time_off_info, :a, text: 'Manage', index: 1, class: 'btn btn-default btn-xs no-collapse') # rubocop:disable Style/LineLength
  element(:view_time_off_info, :a, text: 'View', class: 'btn btn-default btn-xs no-collapse') # rubocop:disable Style/LineLength
  link(:expand_all, text: 'Expand All')
  link(:collapse_all, text: 'Collapse All')
  table(:general_info_table, index: 0)
  table(:project_info_table, index: 1)
  table(:time_off_info_table, index: 2)

  # Methods done on the objects
  def employee_username
    general_info_table_element[0][1].text
  end

  def employee_role
    general_info_table_element[1][1].text
  end

  def employee_manager
    general_info_table_element[3][1].text
  end

  def employee_email
    general_info_table_element[10][1].text
  end
end
