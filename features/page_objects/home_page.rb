# Objects and methods associated with the homepage
class HomePage
  include PageObject

  # Objects on the page
  link(:logout, text: 'Logout')
  link(:admin, text: 'Admin', href: '#')
  link(:departments, text: 'Departments')
  link(:titles, text: 'Titles')
  link(:directory, text: 'Directory')
  link(:employees, text: 'Employees')
  link(:projects, text: 'Projects')

  # Methods done on the objects
  def navigate_to(link)
    if link.split(' ').length > 1
      link = link.downcase.split(' ')
      send(link[0].to_s)
      send(link[1].to_s)
    else
      send(link.downcase.to_s)
    end
  end
end
