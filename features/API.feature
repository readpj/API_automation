@api
Feature: API
  Scenario: API
    Given I want to create a dish
    When I create a dish
    Then A dish is created

  Scenario: Post API
    Given I want to create a dish
    When I create a new dish
    Then A new dish is created

  Scenario: Delete API
    Given I want to create a dish
    When I delete a dish
    Then the dish is deleted
    And the dish cannot be found

  Scenario: Get with parameters counts number of pies
    Given I create a new dish
    When I find the dish
    Then the dishes are found

#    GET /dishes/findOne
#    with parameters
#  {"name" : "Pie"}