Feature: Registration functionality

Scenario: User creates an account only with mandatory fields
Given User has navigates to Register Account page
When User enteres the details into below fields
|firstName   |Pritesh                    |
|lastName    |Sakhare                    |
|telephone   |1234567890                 |
|password    |123454321                  |
And User selects Privacy Policy
And User clicks on Continue button
Then User account should get created sucessfully

Scenario: User creates an account with all fields
Given User has navigates to Register Account page
When User enteres the details into below fields
|firstName   |Pritesh                    |
|lastName    |Sakhare                    |
|telephone   |1234567890                 |
|password    |123454321                  |
And User selects Yes for Newsletter
And User selects Privacy Policy
And User clicks on Continue button
Then User account should get created sucessfully

Scenario: User creates a duplicate account
Given User has navigates to Register Account page
When User enteres the details into below fields with duplicate email
|firstName   |Pritesh                    |
|lastName    |Sakhare                    |
|email       |Priteshsakhare@gmail.com|
|telephone   |1234567890                 |
|password    |123454321                  |
And User selects Yes for Newsletter
And User selects Privacy Policy
And User clicks on Continue button
Then User should get a proper warning about duplicate email

Scenario: User creates an account without filling any details
Given User has navigates to Register Account page
When User dont enter any details into fields
And User clicks on Continue button
Then User should get proper waning for every mandatory fields
