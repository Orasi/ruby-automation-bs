# Objects on the employee page
class EmployeeTimeOffPage
  include PageObject

  # Objects on the page
  span(:delete_request, class: 'glyphicon-trash', index: 0)
  table(:vacation_table, class: 'table')

  # Methods done on the objects
end
