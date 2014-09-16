When(/I create a (.*) title/i) do |title|
  title_page.create_title_with title
end

And(/change the (.*) title to (.*)/i) do |old_title, new_title|
  title_page.edit_title_name_with new_title, old_title
end

And(/delete the (.*) title/i) do |title|
  title_page.delete_title title
end

Then(/the (.*) title should show on the titles page/) do |title|
  @title = title
  expect(title_page.titles_table).to include @title
end

Then(/the (.*) title should no longer be on the titles page/) do |title|
  expect(title_page.titles_table).not_to include title
end

And(/an alert should appear confirming the title was (.*)/) do |alert_message|
  expect(title_page.alert_element).to exist
  expect(title_page.alert_element.text).to include alert_message
end