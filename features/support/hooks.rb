browser = Watir::Browser.new :firefox

Before do 
	@browser = browser
end

After do 
  if @browser.link(href: '/logout').exists?
    @browser.link(href: '/logout').click
    @browser.link(id: 'login-help-link').wait_until_present
  end
end

at_exit do 
	browser.close
end
