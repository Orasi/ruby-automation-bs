@item_count
Feature: Item Count On Employee Page
	
	All employees that work at Orasi will be listed on the employee
	page, accessible only as admin user. 

	In order for the admin user to search through the list of employees
	easier, the admin should have the ability to choose how many employees
	are viewed per page.  

	Background: Log in as an admin and navigate to employee page
		Given that I am logged in as a company admin
		And I navigated to the employees page
	
	Scenario: Change Number of Employees Viewed to 20
		When I change the number of employees viewed per page to 20
		Then the employee table should show the first 20 employees
		
	Scenario: Scenario: Change Number of Employees Viewed to 15
		When I change the number of employees viewed per page to 15
		Then the employee table should show the first 15 employees
		
	Scenario: Scenario: Change Number of Employees Viewed to 10
		When I change the number of employees viewed per page to 10
		Then the employee table should show the first 10 employees
		
	Scenario: Scenario: Change Number of Employees Viewed to 5
		When I change the number of employees viewed per page to 5
		Then the employee table should show the first 5 employees
		