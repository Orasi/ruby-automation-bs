@search_employee
Feature: Search By Employee Page

	All employees that work at Orasi will be listed 
	on the employee page, accessible only through an admin user. 

	In order for the admin to be able to find an employee easily, 
	the admin should have the ability to search through the employee list
	by any criteria listed on the employee table. 

	Background: Log in as an admin and navigate to employee page
		Given that I am logged in as a company admin
		And I navigated to the employees page

  	@only
  	Scenario: Search By First Name
		When I search for an employee by their first name
		Then the results should show the employees fitting the search criteria
	
	@skip
	Scenario: Search By Last Name
	  	When I search for an employee by their last name
	  	Then the results should show the employees fitting the search criteria
	
	Scenario: Search By Portion of Name
	  	When I search for an employee by only a portion of their name
		Then the results should show the employees fitting the search criteria
		
  	Scenario: Search By Location
		When I search for an employee by location
		Then the results should show the employees fitting the search criteria
		
  	Scenario: Search By Title
		When I search for an employee by their title
		Then the results should show the employees fitting the search criteria
		
  	Scenario: Search By Supervisor
		When I search for an employee by their supervisor
		Then the results should show the employees fitting the search criteria
		
  	Scenario: Search By Project
		When I search for an employee by their project
		Then the results should show the employees fitting the search criteria
