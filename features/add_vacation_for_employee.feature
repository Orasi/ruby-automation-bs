Feature: Add Vacation For Employee
	As a manager or higher user, I should be able to add vacation days for an employee that reports to me.
	
	# Background: Navigation to Employee Summary Page
	# 	Given that I am logged in as <user>
	# 	And I navigate to the employee summary page
	# 	And I note the Time Off Details on the employee summary page
	# 	And I navigate to the manage pto page
		
	Scenario Outline: Add Vacation Days For Employee
		When I enter a <start date> and an <end date>
		And I select <type>
		And I select <duration>
		Then the PTO request should be saved
		
		Examples:
		
		| user          |
		| manager       |
		| dept head     |
		| dept admin    |
		| company admin |
		
		| start date    |
		| 04/25/14      |
		| 08/27/14      |     
		
		| end date      |
		| 05/05/14      |
		| 09/03/14      |
		
		| type             |
		| sick             |
		| vacation         |
		| floating holiday |
		| other            |
		
		| duration |
		| full day |
		| half day |