browser = Watir::Browser.new :firefox

Before do 
	@browser = browser
end

After do 
	@browser.link(text: 'Logout').click
end

at_exit do 
	browser.close
end
