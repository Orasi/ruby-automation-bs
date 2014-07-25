Feature: Email Team
	As a manager or higher user, I should be able to email my direct reports.
	
	Scenario Outline: Email Direct Reports
		Given that I am logged in as <user>
		When I select the email team button
		Then I should be able to send an email to my direct reports
		
		Examples:
		
		| user          |
		| manager       |
		| dept head     |
		| dept admin    |
		| company admin |
	
	