When(/I sort by (.*) in (.*) order/i) do |sortby, order|
  @browser.table(class: 'table').wait_until_present
  @browser.link(text: /#{sortby}/i).click
  @browser.link(text: /#{sortby}/i).click if order == 'ascending'
end

Then(/the (.*) column should be sorted in (.*) order/i) do |sortby, order|
  browser_table = @browser.table(class: 'table')
  row_count = browser_table.rows.length
  headers = browser_table.tr.ths.map { |x| x.text.downcase }
  column_index = headers.index(sortby.downcase)
  remove_angular_hidden_cells = proc { |c| !c.class_name.include?('ng-hide') }
  (1..row_count - 2).each do |index|
    previous_row = browser_table.rows[index]
    next_row = browser_table.rows[index + 1]
    if order == 'ascending'
      expect(previous_row.cells.select(&remove_angular_hidden_cells)[column_index].text)
        .to be <= next_row.cells.select(&remove_angular_hidden_cells)[column_index].text
    else
      expect(previous_row.cells.select(&remove_angular_hidden_cells)[column_index].text)
        .to be >= next_row.cells.select(&remove_angular_hidden_cells)[column_index].text
    end
  end
end
