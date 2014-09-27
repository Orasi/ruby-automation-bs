ENV['SCREENSHOTS'] ||= 'false'
require 'page-object'

Before do
  @employee = {
    first_name: 'Test',
    last_name: 'User',
    title: 'Software Consultant',
    supervisor: 'Manager-Test User',
    project: 'WatchDogs2',
    location: 'Greensboro'
  }
end


After do
  # make sure the browser is logged out before beginning the new scenario
  if home_page.logout?
    home_page.logout
    login_page.wait_until 10, 'Did not successfully log out' do
      login_page.login_help?
    end
  end
end

After('@add_departments') do
  home_page.admin
  home_page.departments
  department_page.delete_department @department_name
end

After('@add_title') do
  home_page.admin
  home_page.titles
  title_page.delete_title @title
end

After do |scenario|
  # take a screenshot and add it to the report if the scenario failed.
  if scenario.failed? && ENV['SCREENSHOTS'] == 'true'
    case scenario
    when Cucumber::Ast::Scenario
      title = scenario.feature.title
      name = scenario.name
      info = "#{title}_#{name}"
    when Cucumber::Ast::OutlineTable::ExampleRow
      title = scenario.scenario_outline.feature.title
      name = scenario.scenario_outline.name
      example = scenario.name.gsub('|', '').strip
      info = "#{title}_#{name}_#{example}"
    end
    time = Time.now.strftime('%Y%m%d_%H%M%S')
    screenshot = "./screenshots/#{time}--FAILED--#{info}.png"
    @browser.screenshot.save screenshot
    # embed screenshot, 'image/png'
    encoded_img = @browser.driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}", 'image/png')
  end
end
