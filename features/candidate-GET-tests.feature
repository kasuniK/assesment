Feature: Candidate GET Tests
    In order to get candidates
    As a tester
    I want to retriev all candidates and need retriev only by id

    Scenario: Testing Get1 1
        When I send a 'GET' request to 'http://localhost:3000/candidates'
        Then I should receive a response with the status 200
        And I should receive a response within 250ms

    Scenario: Testing Get 2
        When I send a 'GET' request to 'http://localhost:3000/candidates/333333'
        Then I should receive a response with the status 200
        And I should receive a response within 250ms
