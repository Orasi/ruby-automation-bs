Feature: Add Vacation For Employee
	As a manager or higher user, I should be able to add vacation days for an employee that reports to me.

	Scenario Outline: Add Vacation Days For Employee
		Given that I am logged in as <user>
		And I navigate to the employee summary page
		And I note the Time Off Details on the employee summary page
		And I navigate to the manage pto page
		When I enter a <type> request for a <duration> day that starts on <start_date> and ends <end_date>
		Then the PTO request should be saved

		Examples:

		| user          | start_date | end_date   | type			 | duration |
		| manager       | 2014-12-01 | 2014-12-02 | Sick			 | Ful      |
		| dept head     | 2014-12-08 | 2014-12-09 | Vacation 		 | Full     |
		| dept admin    | 2014-12-15 | 2014-12-16 | Floating Holiday | Half 	|
		| company admin | 2014-12-22 | 2014-12-23 | Other			 | Half	    |
