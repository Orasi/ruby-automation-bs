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

    Scenario Outline: Searching
      When I search for an employee by their <criteria>
      Then the results should show the employees fitting the search criteria

      Examples:
        | criteria   |
        | first name |
        | last name  |
        | location   |
        | title      |
        | supervisor |
        | project    |

	Scenario: Search By Portion of Name
      When I search for an employee by only a portion of their name
      Then the results should show the employees fitting the search criteria
