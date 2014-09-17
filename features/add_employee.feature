Feature: Add Employee
  
    In order for the admin to manage employess, the admin
    should have the ability to add employees.
    
    Background: Log in as admin and navigate to employees page
	Given that I am logged in as a company admin
	And I navigate to the Admin Employees page

    Scenario: Adding Employee
      When I click on the add employee link
      And add a employee
      Then the employee should show on the employees page
      And an alert should appear confirming the employee was added