Feature: Candidate DELETE Tests
    In order delete candidates
    As a tester
    I want to send delete requests

    Scenario: Delete candidate 444444
        Given I am using basic authentication with the credentials:
            | username | tester  |
            | password | iloveqa |
        When I send a 'DELETE' request to 'http://localhost:3000/candidates/444444' 
        Then I should receive a response with the status 204
        And I should receive a response within 250ms

        Scenario: Delete candidate (should not allow to delete without id)
        Given I am using basic authentication with the credentials:
            | username | tester  |
            | password | iloveqa |
        When I send a 'DELETE' request to 'http://localhost:3000/candidates/' 
        Then I should receive a response with the status 405
        And I should receive a response within 250ms

    Scenario: Retriving candidate 444444 (shoud be deleted)
        When I send a 'GET' request to 'http://localhost:3000/candidates/444444'
        Then I should receive a response with the status 404
        And I should receive a response within 250ms