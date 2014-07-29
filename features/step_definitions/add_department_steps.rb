When(/I click on the (.*) link/) do |link|
  @browser.link(text: /#{link}/i).click
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

And(/an alert should appear confirming the department was added/) do
  expect(@browser.div(class: 'alert', text: /successfully/i)).to exist
end
