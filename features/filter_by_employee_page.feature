Feature: Filter By Employee Page
	As an admin user I should be able to filter the employee page to show all employees, direct reports, or only inactive employees and results should be shown.
	
	Scenario: Filter Employee Table to Show All Employees
		Given the employee page
		When I filter using the all button
		Then the employee table should show all employees
	
	Scenario: Filter Employee Table to Show Direct Reports
		Given the employee page
		When I filter using the direct button
		Then the employee table should show only direct reports
		
	Scenario: Filter Employee Table to Show Inactive Employees
		Given the employee page
		When I filter using the show inactives button
		Then the employee table should show only the inactive employees
		