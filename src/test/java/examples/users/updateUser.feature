Feature: Reqres API

  Scenario: Update pre-defined user
    * def createdUser = call read('createUser.feature')
    Given url 'https://reqres.in/api/users/2'
    When request {'name':'#(createdUser.response.name)','job':'spy'}
    And method put
    Then status 200
    And match response == {'name':'#(createdUser.response.name)','job':'spy','updatedAt':'#ignore'}