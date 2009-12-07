Feature: Managing tiendas
  In order to CRUD tiendas
  As an admin
  I want to CRUD tiendas
        

  Scenario: Browsing tiendas
    Given there is a Tienda called "900 Biscayne"
    Given there is a Tienda called "50 Biscayne"
    Given I am on the homepage
    Then I should see "900 Biscayne"
    Then I should see "50 Biscayne"
    
  Scenario: Adding a Store
    Given I am on the new tienda page
    When I fill in the following:
    | tienda_nombre | Mi tienda |
    | tienda_direccion | 900 biscayne bay |
    | tienda_ciudad | miami |
    | tienda_estado | florida |
    | tienda_pais | usa |
    | tienda_codigo_postal| 33132|
    When I press "sugerir franquicia"
    Then I should see "Tienda was successfully created."
    
  Scenario: Deleting a Store
    Given there is a Tienda called "Delete Me" with id "80"
    When I browse to tienda "80" page like an admin
    Then I should see "Borrar"
    When I follow "Borrar"
    When I go to the homepage
    When I should not see "Delete Me"
    
  Scenario: Editing a Store
    Given there is a Tienda called "Edit Me" with id "99"
    When I browse to tienda "99" page like an admin
    And I follow "editar"
    And I fill in the following:
    | tienda_nombre | Edited |
    | tienda_direccion | sambil caracas venezuela |
    When I press "update"
    Then I should see "Tienda was successfully updated."
    