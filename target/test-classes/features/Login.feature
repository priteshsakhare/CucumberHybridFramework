Feature: Login functionality

  Scenario Outline: Login with valid credentials
    Given User navigates to login page
    When User enteres valid email address <username> into email field
    And User enteres valid password <password> into password field
    And User clicks on Login button
    Then User should get successfully logged in
Examples:
|username|password|
|priteshsakhare@gmail.com |54321|
|priteshsakhare@gmail.com |54321|
|priteshsakhare@gmail.com |54321|
  Scenario: Login with invalid credentials
    Given User navigates to login page
    When User enteres invalid email address into email field
    And User enteres invalid password "123454321" into password field
    And User clicks on Login button
    Then User should get a proper warning message about credentials mismatch

  Scenario: Login with valid email and invalid password
    Given User navigates to login page
    When User enteres valid email address "priteshsakhare@gmail.com" into email field
    And User enteres invalid password "123454321" into password field
    And User clicks on Login button
    Then User should get a proper warning message about credentials mismatch

  Scenario: Login with invalid email and valid password
    Given User navigates to login page
    When User enteres invalid email address into email field
    And User enteres valid password "54321" into password field
    And User clicks on Login button
    Then User should get a proper warning message about credentials mismatch

  Scenario: Login without providing any credentials
    Given User navigates to login page
    When User dont enter email address into email field
    And User dont enter password into password field
    And User clicks on Login button
    Then User should get a proper warning message about credentials mismatch
