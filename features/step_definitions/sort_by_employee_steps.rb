Given (/The employee page/i) do
	@browser.goto 'https://bluesourcestaging.herokuapp.com'
	@browser.link(text: "Can't log in?").wait_until_present
	@browser.text_field(id: 'employee_username').set "company.admin"
	@browser.text_field(id: 'employee_password').set "password"
	@browser.button(value: 'Login').click
end

When (/I sort by (.*) in (.*) order/i) do |sortby, order|
	@browser.table(class: 'table').wait_until_present
	@browser.link(text: /#{sortby}/i).click
	if order == "ascending"
        		@browser.link(text: /#{sortby}/i).click        	
	end
end

Then (/the (.*) column should be sorted in (.*) order/i) do |sortby, order|
	rows=@browser.table(class: "table").rows.length
	headers=@browser.table(class: "table").tr.ths.collect { |x| x.text.downcase }
	column_index=headers.index(sortby.downcase)
	if order=="ascending"
		i=1	
		while (i<(rows-1))
			expect(@browser.table(class: 'table')[i][headers.index(sortby.downcase)].text).to be <= @browser.table(class: 'table')[i+1][column_index].text	
			i=i+1
		end
	else
		i=1
		while (i<(rows-1))
			expect(@browser.table(class: 'table')[i+1][headers.index(sortby.downcase)].text).to be <= @browser.table(class: 'table')[i][column_index].text
			i=i+1
		end
	end	
end
