Before do
  @employee = {
    first_name: 'Test',
    last_name: 'User',
    title: 'Software Consultant',
    supervisor: 'Manager-Test User',
    project: 'WatchDogs2',
    location: 'Greensboro'
  }
  
  # make sure the browser is logged out before beginning the new scenario
  if @browser.link(href: '/logout').exists?
    @browser.link(href: '/logout').click
    @browser.link(id: 'login-help-link').wait_until_present
  end
end

After do |scenario|
  # take a screenshot and add it to the report if the scenario failed.
  if scenario.failed?
    screenshot = "./screenshots/#{Time.now.getutc}_FAILED_#{scenario.name}_.png"
    @browser.screenshot.save screenshot
    embed screenshot, 'image/png'
  end
end

After('@add_departments') do
  @browser.link(text: 'Admin').click
  @browser.link(text: 'Departments').click
  @browser.li(text: /#{@department}/i)
          .span(class: 'glyphicon-trash').click
  @browser.alert.ok
end
