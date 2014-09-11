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
  if home_page.logout?
    home_page.logout
    login_page.wait_until 10, 'Did not log out successfully' do
      login_page.login_help?
    end
  end
end

After('@add_departments') do
  home_page.admin
  home_page.departments
  department_page.delete_department @department_name
end
