Feature: Item Count On Employee Page
	As a user I should be able to adjust the number of employees viewed per page via the employees per page drop down box.
	
	Scenario: Change Number of Employees Viewed to 20
		Given the employee page
		When I change the number of employees viewed per page to 20
		Then the employee table should show the first 20 employees
		
	Scenario: Scenario: Change Number of Employees Viewed to 15
		Given the employee page
		When I change the number of employees viewed per page to 15
		Then the employee table should show the first 15 employees
		
	Scenario: Scenario: Change Number of Employees Viewed to 10
		Given the employee page
		When I change the number of employees viewed per page to 10
		Then the employee table should show the first 10 employees
		
	Scenario: Scenario: Change Number of Employees Viewed to 5
		Given the employee page
		When I change the number of employees viewed per page to 5
		Then the employee table should show the first 5 employees
		