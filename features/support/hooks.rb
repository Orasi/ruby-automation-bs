Before do |scenario|
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
    case scenario
      when Cucumber::Ast::Scenario
        info = "#{scenario.feature.title}_#{scenario.name}"
      when Cucumber::Ast::OutlineTable::ExampleRow
        info = "#{scenario.scenario_outline.feature.title}_#{scenario.scenario_outline.name}_#{scenario.name.gsub('|', '').strip}"
    end
    time = Time.now.strftime('%Y%m%d_%H%M%S')
    screenshot = "./screenshots/#{time}|FAILED|#{info}.png"
    @browser.screenshot.save screenshot
    embed screenshot, 'image/png'
  end
end

After('@add_departments') do
  home_page.admin
  home_page.departments
  department_page.delete_department @department_name
end
