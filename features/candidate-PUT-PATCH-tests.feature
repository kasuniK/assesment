Feature: Candidate PUT Tests
    In order update candidates
    As a tester
    I want to send patch put requests

    Scenario: Candidate Patch 111111
        Given I am using basic authentication with the credentials:
            | username | tester  |
            | password | iloveqa |
        When I send a 'PATCH' request to 'http://localhost:3000/candidates/111111'
        When I add the request body:
            """
            {
            "firstName": "Donald"
            }
            """
        Then I should receive a response with the status 200
        And I should receive a response within 250ms
        And the response body json path at "$.firstName" should equal "Donald"
        And the response body json path at "$.lastName" should equal "Berrocal"
        And the response body json path at "$.matchingScore" should equal "54"
        And the response body json path at "$.vacancyTitle" should equal "Software Engineer"
        And the response body json path at "$.id" should equal "111111"

    Scenario: Candidate Put 111111
        Given I am using basic authentication with the credentials:
            | username | tester  |
            | password | iloveqa |
        When I send a 'PUT' request to 'http://localhost:3000/candidates/111111'
        When I add the request body:
            """
            {
                "firstName": "Donald",
                "lastName": "Trump",
                "matchingScore": 3,
                "vacancyTitle": "President"
            }
            """
        Then I should receive a response with the status 200
        And I should receive a response within 500ms
        And the response body json path at "$.firstName" should equal "Donald"
        And the response body json path at "$.lastName" should equal "Trump"
        And the response body json path at "$.matchingScore" should equal "3"
        And the response body json path at "$.vacancyTitle" should equal "President"
        And the response body json path at "$.id" should equal "111111"

    Scenario: Candidate Get 111111
        When I send a 'GET' request to 'http://localhost:3000/candidates/111111'
        Then I should receive a response with the status 200
        And I should receive a response within 250ms
        And the response body json path at "$.firstName" should equal "Donald"
        And the response body json path at "$.lastName" should equal "Trump"
        And the response body json path at "$.matchingScore" should equal "3"
        And the response body json path at "$.vacancyTitle" should equal "President"
        And the response body json path at "$.id" should equal "111111"
