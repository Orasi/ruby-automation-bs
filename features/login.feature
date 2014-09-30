@login
Feature: Login
	Users will have the ability to request time off through
    Bluesource.

    In order for users to access Bluesource, they must be able
    to login with a valid username and password.

	Scenario: Successful login with username
      Given I enter a valid username and password
      When I log into Bluesource
      Then I should land on the homepage

    Scenario: Login without username
      Given I fill in only the password field
      When I log into Bluesource
      Then I should not be logged in

    Scenario: Login without password
      Given I fill in only the username field
      When I log into Bluesource
      Then I should not be logged in