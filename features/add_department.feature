@add_departments
Feature: Add Departments

	Orasi consists of multiple departments and subdepartments
	that will be viewable only by the admin. 
	
	In order for the admin to manage these departments, the admin
	should have the ability to add departments.

	Background: Log in as admin and navigate to departmetns page
	Given that I am logged in as a company admin
	And I navigate to the Admin Departments page

	Scenario: Adding Departments
	When I click on the add department link
	And create an iPhone department with no parent department
	Then the iPhone department should show on the departments page
	And an alert should appear confirming the department was added 
	
	Scenario: Adding a department as a subdepartment
	When I click on the add department link 
	And create an iPhone department with Mobile as the parent department  
	Then the iPhone department should show on the departments page
	And be placed under the Mobile department
	And an alert should appear confirming the department was added
