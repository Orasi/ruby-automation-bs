When(/I click on the (.*) link/) do |link|
  @browser.link(text: /#{link}/i).click
end

And(/create (?:a|an) (\w+) department with (\w+) as the parent department/) do |department, parent_department|
  @department = department
  @browser.link(text: /add\ departments/i).click
  @browser.text_field(id: 'department_name').set @department
  @browser.select_list(id: 'department_department_id').select parent_department
  @browser.button(value: 'Create Department').click
end

And(/create (?:an|a) (\w+) department/) do |name|
  @browser.text_field(id: 'department_name').set name
  @browser.button(value: 'Create Department').click
end

Then(/the (\w+) department should show on the departments page/) do |name_of_department|
  departments = []
  @browser.lis(class: 'list-group-item').each do |list_of_names|
    departments << list_of_names.text.split(' ')[0]
  end
  expect(departments).to include(name_of_department)
end

And(/be placed under the Mobile department/) do |parent_department|
  parent = @browser.li(text: /#{parent_department}/i)
           .attribute_value('style')[/\d+/]
  child = @browser.li(text: /#{@department}/i).attribute_value('style')[/\d+/]


And(/an alert should appear confirming the department was added/) do
  expect(@browser.div(class: 'alert', text: /successfully/i)).to exist
end
