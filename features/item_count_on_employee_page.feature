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

    Scenario Outline: Change Employee View Number
      When I change the number of employees viewed per page to <number>
      Then the employee table should show the first <number> employees

      Examples:
        | number |
        | 20     |
        | 15     |
        | 10     |
        | 5      |
		