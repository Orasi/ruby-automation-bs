class LoginPage
  include PageObject

  URL = 'bluesourcestaging.herokuapp.com'

  #Objects on the page
  text_field(:username, id: 'employee_username')
  text_field(:password, id: 'employee_password')
  button(:login, name: 'commit')
  link(:login_help, text: "Can't log in?")

  #Methods done on the objects
  def open
    @browser.goto URL
  end

  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end

end

