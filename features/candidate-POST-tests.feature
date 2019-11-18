Feature: Candidate POST Tests
    In order create candidates
    As a tester
    I want to create and validate

    Scenario: Creating candidate Kasuni
        Given I am using basic authentication with the credentials:
            | username | tester  |
            | password | iloveqa |
        When I send a 'POST' request to 'http://localhost:3000/candidates'
        When I add the request body:
            """
            {
                "firstName": "Kasuni",
                "lastName": "Kariyawasam",
                "matchingScore": 4,
                "vacancyTitle": "TestVacancyTitle"
            }
            """
        Then I should receive a response with the status 201
        And I should receive a response within 500ms
        And the response body json path at "$.firstName" should equal "Kasuni"
        And the response body json path at "$.lastName" should equal "Kariyawasam"
        And the response body json path at "$.matchingScore" should equal "4"
        And the response body json path at "$.vacancyTitle" should equal "TestVacancyTitle"

    Scenario: Creating candidate Kasuni%%%%,  Should not allow special characters
        Given I am using basic authentication with the credentials:
            | username | tester  |
            | password | iloveqa |
        When I send a 'POST' request to 'http://localhost:3000/candidates'
        When I add the request body:
            """
            {
                "firstName": "Kasuni%%%%",
                "lastName": "Kariyawasam",
                "matchingScore": 4,
                "vacancyTitle": "TestVacancyTitle"
            }
            """
        Then I should receive a response with the status 400
        And I should receive a response within 500ms
        And the response body json path at "$.firstName" should equal "Kasuni"
        And the response body json path at "$.lastName" should equal "Kariyawasam"
        And the response body json path at "$.matchingScore" should equal "4"
        And the response body json path at "$.vacancyTitle" should equal "TestVacancyTitle"

    Scenario: Creating candidate,  Should not allow null values
        Given I am using basic authentication with the credentials:
            | username | tester  |
            | password | iloveqa |
        When I send a 'POST' request to 'http://localhost:3000/candidates'
        When I add the request body:
            """
            {
                "firstName": "",
                "lastName": "",
                "matchingScore": 4,
                "vacancyTitle": ""
            }
            """
        Then I should receive a response with the status 400
        And I should receive a response within 500ms

    Scenario: Creating candidate,  matchingScore should be  >= 0
        Given I am using basic authentication with the credentials:
            | username | tester  |
            | password | iloveqa |
        When I send a 'POST' request to 'http://localhost:3000/candidates'
        When I add the request body:
            """
            {
                "firstName": "",
                "lastName": "",
                "matchingScore": -1,
                "vacancyTitle": ""
            }
            """
        Then I should receive a response with the status 400
        And I should receive a response within 500ms
