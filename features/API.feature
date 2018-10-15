Feature: API
#  @api
  Scenario: API
    Given I want to create a dish
    When I create a dish
    Then A dish is created

  Scenario: Post API
    Given I want to create a dish
    When I create a new dish
    Then A new dish is created

  @api
  Scenario: Delete API
    Given I want to create a dish
    When I delete a dish
    Then the dish is deleted
    And the dish cannot be found

#    GET /dishes/findOne
#    with parameters
#  {"name" : "Pie"}