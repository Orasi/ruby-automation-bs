Given (/The login page/i) do
	@browser.goto 'https://bluesourcestaging.herokuapp.com'
end

When (/I enter in valid credentials/i) do
	@browser.text_field(id: 'employee_username').set "company.admin"
	@browser.text_field(id: 'employee_password').set "password"
end

And (/click the login button/i) do 
	@browser.button(value: 'Login').click
end

Then (/I should land on the homepage/) do
	@browser.element(class: "navbar-collapse").text.include? "Logout"
end
