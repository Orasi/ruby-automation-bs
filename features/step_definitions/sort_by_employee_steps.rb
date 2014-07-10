Given (/The employee page/i) do
	@browser.goto 'https://bluesourcestaging.herokuapp.com'
end

When (/I sort by (.*) in (.*) order/i) do |sortby| |order|
	@browser.table(class: 'table').wait_until_present
	@browser.link(text: /#{sortby}/i).click
	if order == "ascending"
          {
          @browser.link(text: /#{sortby}/i).click
          }
end

Then (/Then the "(.*)" column should be sorted in "(.*)" order /) do |sortby| |order|
	rows=@browser.table(class: "table").rows.lengh
	headers=@browser.table(class: "table").tr.ths.collect { |x| x.text.downcase }
	column_index=headers.index(/#{sortby}/i)
	
