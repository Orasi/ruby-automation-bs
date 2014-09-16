@manage_titles
Feature: Manage Titles

  Each employee working at Orasi will be given a title.

  In order for the admin to manage the titles that are available,
  the admin should have the ability to edit, add, and delete titles

  Background: Log in as an admin and navigate to employee page
    Given that I am logged in as a company admin
    And I navigated to the admin titles page

  @add_title
  Scenario: Add Titles
    When I create a Contractor title
    Then an alert should appear confirming the title was created
    And the Contractor title should show on the titles page

  @add_title
  Scenario: Edit Titles
    When I create a Contractor title
    And change the Contractor title to QA Tester
    Then an alert should appear confirming the title was updated
    And the QA Tester title should show on the titles page

  @delete_title
  Scenario: Delete Titles
    When I create a Contractor title
    And delete the Contractor title
    Then an alert should appear confirming the title was deleted
    And the Contractor title should no longer be on the titles page
