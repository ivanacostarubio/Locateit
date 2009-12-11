Feature: Searching for a Tienda
  In order to find a tienda in any city
  As a user
  I want see a list of Tiendas near me
  
  Scenario: 
    Given there is a Tienda in "Miami" called "Dolphin"
    Given there is a Tienda in "Orlando" called "Tiger"
    When I browse the "Orlando" page
    Then I should see "TIGER"
    