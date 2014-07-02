Feature: Sort By Employee Page
As a user I should be able to sort by any column in ascending or descending order and results should be shown.

  Scenario: Sort First Name in Ascending Order
    Given the employee page
		When I sort by first name in ascending order
		Then the results should be shown

  Scenario: Sort First Name in Descending Order
    Given the employee page
		When I sort by first name in descending order
		Then the results should be shown

  Scenario: Sort Last Name in Ascending Order
    Given the employee page
		When I sort by last name in ascending order
		Then the results should be shown
		
  Scenario: Sort Last Name in Descending Order
    Given the employee page
		When I sort by last name in descending order
		Then the results should be shown
		
  Scenario: Sort Title in Ascending Order
    Given the employee page
		When I sort by title in ascending order
		Then the results should be shown
		
  Scenario: Sort Title in Descending Order
    Given the employee page
		When I sort by title in descending order
		Then the results should be shown
		
  Scenario: Sort Project in Ascending Order
    Given the employee page
		When I sort by project in ascending order
		Then the results should be shown
		
  Scenario: Sort Project in Descending Order
    Given the employee page
		When I sort by project in descending order
		Then the results should be shown
		
  Scenario: Sort Location in Ascending Order
    Given the employee page
		When I sort by location in ascending order
		Then the results should be shown
		
  Scenario: Sort Location in Descending Order
    Given the employee page
		When I sort by location in descending order
		Then the results should be shown
		
  Scenario: Sort Supervisor in Ascending Order
    Given the employee page
		When I sort by supervisor in ascending order
		Then the results should be shown
		
  Scenario: Sort Supervisor in Descending Order
    Given the employee page
		When I sort by supervisor in descending order
		Then the results should be shown
