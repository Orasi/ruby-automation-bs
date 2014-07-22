Feature: Sort By Employee Page
	As a user I should be able to sort by any column in ascending or descending order and results should be shown.

    Background: Log in as an admin and navigate to employee page
      Given that I am logged in as a company admin
      And I navigated to the employees page

    Scenario Outline: Sorting
      When I sort by <criteria> in <sort_order> order
      Then the <criteria> column should be sorted in <sort_order> order

      Examples:
        | criteria   | sort_order |
        | first name | ascending  |
        | first name | descending |
        | last name  | ascending  |
        | last name  | descending |
        | title      | ascending  |
        | title      | descending |
        | project    | ascending  |
        | project    | descending |
        | location   | ascending  |
        | location   | descending |
        | supervisor | ascending  |
        | supervisor | descending |
