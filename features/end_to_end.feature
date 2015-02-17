Feature: The web service displays the correct version

  Scenario: I request the page with a major increment
    Given the web server is running
    When I request the page with version '1.2.3' and a 'major' increment
    Then the text that comes back contains '2.2.3'

  Scenario: I request the page with a minor increment
    Given the web server is running
    When I request the page with version '1.2.3' and a 'minor' increment
    Then the text that comes back contains '1.3.3'

  Scenario: I request the page with a patch increment
    Given the web server is running
    When I request the page with version '1.2.3' and a 'patch' increment
    Then the text that comes back contains '1.2.4'
