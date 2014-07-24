Feature Add Departments

	Orasi consists of multiple departments and subdepartments
	that will be viewable only by the admin. 
	
	In order for the admin to manage these departments, the admin
	should have the ability to add departments.

	Background Log in as admin and navigate to departmetns page
	Given that I am logged in as a company admin
	And I navigate to the departments page

	Scenario Adding Departments
	When I click on the add departments link
	And create an iPhone department
	Then the iPhone department should show on the departments page

