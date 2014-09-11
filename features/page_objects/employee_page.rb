# Objects on the employee page
class EmployeePage
  include PageObject

  # Objects on the page
  select_list(:employee_per_page, id: 'employee_preferences_resourcesPerPage')
  table(:employee_table, class: 'table-bordered')
  link(:email_team, text: 'Email team')
  paragraph(:results, class: 'ng-binding')

  # Methods done on the objects
  def total_employee_results
    results.split(' of ').last.to_i
  end
end
