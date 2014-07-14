When (/I change the number of employees viewed per page to (\d+)/) do |pages|
	@browser.select_list(id: 'employee_preferences_resourcesPerPage').select pages 
end
		

Then (/the employee table should show the first (\d+) employees/) do |pages|
	@browser.table(class: 'table').wait_until_present
	row_count = @browser.table(class: 'table').trs.count - 1
	expect(pages).to eq(row_count.to_s)
end