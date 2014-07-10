Feature: Login
	As a user I should be able to login to the homepage with valid credentials. 

	Scenario: Login Happy Path
		Given the login page 
		When I enter in valid credentials 
		And click the login button
		Then I should land on the homepage
