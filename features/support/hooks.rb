Before do
	@employee = {first_name: "David", 
				last_name: "Quach", 
				title: "Manager", 
				supervisor: 'Adam Thomas', 
				project: 'WatchDogs2', 
				location: 'Greensboro'}
end

After do
  if @browser.link(href: '/logout').exists?
    @browser.link(href: '/logout').click
    @browser.link(id: 'login-help-link').wait_until_present
  end
end
