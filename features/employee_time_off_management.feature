Feature: Employee Time Off Management
	As an manager or higher user, I should be able to verify that the data on the employee summary page for time off matches the manage pto page. 
	
	Background: Navigation to Employee Summary Page
		Given that I am logged in as a company admin
		And I navigate to the employees page
		And I note the data shown on the employee summary page
		And I navigate to the manage pto page
	
	Scenario: Employee at Orasi for less than 1 year
		When I select an employee who has been at Orasi for less than 1 year
		Then the data on the employee summary page should match the data on the manage pto page
		
	Scenario: Employee at Orasi for more than 3 years
		When I select an employee who has been at Orasi for more than 3 years
		Then the data on the employee summary page should match the data on the manage pto page
		
	Scenario: Employee at Orasi for more than 6 years
		When I select an employee who has been at Orasi for more than 6 years
		Then the data on the employee summary page should match the data on the manage pto page
		
	Scenario: Employee has a mid-year anniversary
		When I select an employee who has an anniversary during the middle of the year
		Then the data on the employee summary page should match the data on the manage pto page
		
	#Background: Navigation to Employee Summary Page
	#	Given that I am logged in as <user>
	#	And I navigate to the employee summary page
	#	And I note the data shown on the employee summary page
	#	And I navigate to the manage pto page
		
	#Scenario Outline: Employee Vacation and Sick Time
	#	When I select an employee who has been at Orasi for <years>
	#	Then the employee should have <vacation days> and <sick days> and the data on the employee summary page should match the data on the manage pto page
		
	#	Examples:
	#	|     user     |
	#	|manager	   |
	#	|dept head	   |
	#	|dept admin	   |
	#	|company admin |
	
	#	| years | vacation days | sick days | 
	#	| >1    | 				|			| 
	#	| 1		| 10			| 10 		|
	#	| 3		| 15			| 10		|
	#	| 6		| 20			| 10        |
	
	#Scenario Outline: Employee Mid-Year Anniversary
		When I select an employee who has an anniversary date of <anniv date>
		Then the employee should have <vacation days> and <sick days> and the data on the employee summary page should match the data on the manage pto page
	
	#	| anniv date | vacation days | sick days | 
	#	|            | 				 |			 | 
	#	| 		     |      		 |  		 |
	
	
