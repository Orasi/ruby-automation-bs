Given (/that I am logged in as a (\w+\s*\w+)/) do |user|
	@browser.goto "https://bluesourcestaging.herokuapp.com"
	user = user.split(" ").join('.')
	@browser.text_field(id: 'employee_username').set user
	@browser.text_field(id: 'employee_password').set "password"
	@browser.button(value: "Login").click
end

And (/I navigated to the (\w*) page/) do |page|
	@browser.element(class: 'navbar').link(text: /#{page}/i).click
end

When (/I search for an employee by (?:their )?(\w+\s*\w+)$/) do |criteria|
	@browser.table(class: 'table').wait_until_present
	if criteria.split(" ").count > 1
		@criteria = criteria.split(" ").join("_") 
	else
		@criteria = criteria
	end
	@browser.text_field(id: 'search-bar').set @employee[@criteria.to_sym]
end

When (/I search for an employee by only a portion of their name/) do 
	@browser.table(class: 'table').wait_until_present
	@criteria = "first_name"
	@search_for = @employee[@criteria.to_sym][0..3]
	@browser.text_field(id: 'search-bar').set @search_for
end


Then (/the results should show the employees fitting the search criteria/) do
	@browser.table(class: 'table').wait_until_present

	rows = @browser.table(class: 'table').rows.length - 1

	unless @search_for
		search_results = @browser.table(class: 'table').trs(text: /#{@employee[@criteria.to_sym]}/i).count
	else
		search_results = @browser.table(class: 'table').trs(text: /#{@search_for}/i).count
	end

	expect(search_results).to eq(rows)
end