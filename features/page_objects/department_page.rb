# Objects and methods associated with the department page
class DepartmentPage
  include PageObject

  # Objects on the page
  link(:add_department, text: 'Add Department')
  text_field(:department_name, id: 'department_name')
  select_list(:parent_department, id: 'department_department_id')
  button(:create_department, value: 'Create Department')
  list_items(:departments, class: 'list-group-item')
  div(:alert, {class: 'alert', text: /successfully/i})


  # Methods done on the objects
  def create_department_with(name, parent=false)
    self.department_name = name
    self.parent_department = parent if parent
    create_department
  end

  def get_department_attribute(department)
    self.class.list_item(:department, text: /#{department}/i)
    margin = self.department_element.attribute('style')[/\d+/]
    margin.to_i
  end

  def delete_department(department)
    self.class.button(:delete){ list_item_element(text: /#{department}/i).span_element(class: 'glyphicon-trash') }
    self.confirm(true) do
      delete
    end
  end
end