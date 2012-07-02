Feature: delete movie

  As a movie buff
  So that I can remove incorrect information
  I want to delete a movie

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |

Scenario: delete movie
  When I go to the details page for "Star Wars"
  And I press "Delete"
  Then I should be on the home page
  When I check the following ratings: PG
  And I press "Refresh"
  Then I should be on the home page
  And I should not see "Star Wars"
  But I should see "Blade Runner"

