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
end

Then (/Then the "(.*)" column should be sorted in "(.*)" order /) do |sortby| |order|
	rows=@browser.table(class: "table").rows.lengh
	headers=@browser.table(class: "table").tr.ths.collect { |x| x.text.downcase }
	column_index=headers.index(/#{sortby}/i)
	if order="ascending"	
		for i in rows-1
			cell_text = @browser.table(class: 'table')[i][column_index].text
			next_cell_text = @browser.table(class: 'table')[i+1][column_index].text
		        if cell_text >= next_cell_text
				return false
			end
		end
        return true
	elseif
		for i in rows-1
			cell_text = @browser.table(class: 'table')[i][column_index].text
			next_cell_text = @browser.table(class: 'table')[i+1][column_index].text
			if next_cell_text >= cell_text
				return false
			end
		end
	return true
	end	
end
