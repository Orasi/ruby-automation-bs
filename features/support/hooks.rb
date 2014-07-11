browser = Watir::Browser.new :firefox

Before do 
	@browser = browser
end

Before do
	@employee = {first_name: "David", 
				last_name: "Quach", 
				title: "Manager", 
				supervisor: 'Adam Thomas', 
				project: 'WatchDogs2', 
				location: 'Greensboro'}
end


After do
	@browser.link(href: '/logout').click
	@browser.link(id: 'login-help-link').wait_until_present
end

at_exit do 
	browser.close
end