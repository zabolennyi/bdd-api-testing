Feature: Reqres API
  Scenario: Get list of users
    * def userData =
    """
    [
      {
         "id":#number,
         "email":"#string",
         "first_name":"#string",
         "last_name":"#string",
         "avatar":"#string"
      },
     {
         "id":#number,
         "email":"#string",
         "first_name":"#string",
         "last_name":"#string",
         "avatar":"#string"
      },
     {
         "id":#number,
         "email":"#string",
         "first_name":"#string",
         "last_name":"#string",
         "avatar":"#string"
      }
   ]
    """
    Given url 'https://reqres.in//api/users?page=2'
    When method get
    Then status 200
    Then match response ==
          """
          {
          page: '#number',
          per_page: '#number',
          total: '#number',
          total_pages: '#number',
          data: '#(userData)',
          updatedAt: '#ignore'
          }
          """