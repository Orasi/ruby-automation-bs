# Objects and methods associated with the homepage
class HomePage
  include PageObject

  # Objects on the page
  link(:logout, text: 'Logout')

  # Methods done on the objects
end
