Feature: User sign up

  @javascript
  Scenario:
    When I register
    Then I should see my email in header
