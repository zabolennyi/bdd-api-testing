@regression
Feature: Reqres API
    Background:
      * def people = read('../../data/people.json')
  Scenario: Create user
    Given url 'https://reqres.in/api/users'
    * def testName = 'serhii'
    When request {"name":'#(testName)',"job":"qa"}
    And method post
    Then status 201
    And match response == {"name":'#(testName)',"job":"qa","id":'#ignore',"createdAt":'#ignore'}

  Scenario: Create user with unique job id
    Given url 'https://reqres.in/api/users'
    When request {"name":"SERHII","job":"20a7692f-7ed2-479c-bd46-cbe6ef11c6a8"}
    And method post
    Then status 201
    And match response == {"name":'#regex [A-Z]{6}',"job":'#uuid',"id":'#ignore',"createdAt":'#ignore'}

  Scenario: Create user calling java method from API test
    * def testName = 'serhii'
    * def uniqueId = Java.type('utils.NumberUtils').generateUniqueId();
    * def uniqueName = 'UserTest' + uniqueId
    Given url 'https://reqres.in/api/users'
    When request {"name":'#(uniqueName)',"job":'#ignore'}
    And method post
    Then status 201

    Scenario Outline: create <name> user with <job> job
      Given url 'https://reqres.in/api/users'
      And request {'name':'<name>', 'job':'<job>'}
      When method post
      Then status 201
      And match response == {"name":'<name>',"job":"<job>","id":'#string',"createdAt":'#ignore'}

      Examples:
      |people|