Feature: API
#  @api
  Scenario: API
    Given I want to create a dish
    When I create a dish
    Then A dish is created

  @api
  Scenario: Post API
    Given I want to create a dish
    When I create a new dish
    Then A new dish is created