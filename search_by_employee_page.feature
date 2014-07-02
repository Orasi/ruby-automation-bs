Feature: Search By Employee Page
  As a user I should be able to enter a search string and results should be shown.
  	
  	Scenario: Search By First Name
  		Given the employee page
		When I search by first name
		Then the results should show all first names fitting the search criteria
	  
	Scenario: Search By Last Name
    		Given the employee page
	  	When I search by last name
	  	Then the results should be shown
	
	Scenario: Search By Portion of Name
    		Given the employee page
	  	When I search by a portion of a name
		Then the results should be shown
		
  	Scenario: Search By Location
    		Given the employee page
		When I search by location
		Then the results should be shown
		
  	Scenario: Search By Title
    		Given the employee page
		When I search by title
		Then the results should be shown
		
  	Scenario: Search By Supervisor
    		Given the employee page
		When I search by supervisor
		Then the results should be shown
		
  	Scenario: Search By Project
    		Given the employee page
		When I search by project
		Then the results should be shown
