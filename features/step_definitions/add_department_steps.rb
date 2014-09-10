When(/I click on the add department link/) do
  department_page.add_department
end

# rubocop:disable Style/LineLength
And(/create (?:a|an) (\w+) department with (\w+) as the parent department/) do |department, parent_dept|
  @department_name = department
  department_page.create_department_with @department_name, parent_dept
end
# rubocop:enable Style/LineLength

And(/create (?:an|a) (\w+) department with no parent department/) do |name|
  @department_name = name
  department_page.create_department_with @department_name
end

Then(/the (\w+) department should show on the departments page/) do |name_of_department|
  departments = []
  department_page.departments_elements.each do |list_of_names|
    departments << list_of_names.text.split(' ')[0]
  end
  expect(departments).to include(name_of_department)
end

And(/be placed under the (\w+) department/) do |parent_department|
  main_dept = department_page.get_department_attribute parent_department
  sub_dept = department_page.get_department_attribute @department_name
  margin = sub_dept - main_dept
  expect(margin).to eq(20)
end

And(/an alert should appear confirming the department was added/) do
  expect(department_page.alert_element).to exist
end
