When(/I search for an employee by (?:their )?(\w+\s*\w+)$/) do |criteria|
  @browser.table(class: 'table').wait_until_present
  @criteria = criteria.tr_s(' ', '_').to_sym
  @browser.text_field(id: 'search-bar').set @employee[@criteria.to_sym]
end

When(/I search for an employee by only a portion of their name/) do
  @browser.table(class: 'table').wait_until_present
  @criteria = :first_name
  @search_for = @employee[@criteria][0..3]
  @browser.text_field(id: 'search-bar').set @search_for
end

Then(/the results should show the employees fitting the search criteria/) do
  @browser.table(class: 'table').wait_until_present

  rows = @browser.table(class: 'table').rows.length - 1

  if !@search_for
    search_results = @browser
                      .table(class: 'table')
                      .trs(text: /#{@employee[@criteria]}/i).count
  else
    search_results = @browser
                      .table(class: 'table')
                      .trs(text: /#{@search_for}/i).count
  end

  expect(search_results).to eq(rows)
end
