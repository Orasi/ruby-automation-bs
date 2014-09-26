# Objects on the employee page
class EmployeePage
  include PageObject

  # Objects on the page
  select_list(:employee_per_page, id: 'employee_preferences_resourcesPerPage')
  table(:employee_table, class: 'table-bordered')
  div(:email_team, text: 'Email team')
  label(:direct, text: 'Direct')
  paragraph(:results, class: 'ng-binding')
  text_field(:search_employee, id: 'search-bar')

  # Methods done on the objects
  def total_employee_results
    results.split(' of ').last.to_i
  end

  def email_list
    email_team_element.link_element.href.sub('mailto:', '').split(';')
  end
end
